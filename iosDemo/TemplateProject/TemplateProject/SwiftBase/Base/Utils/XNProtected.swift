//
//  Protected.swift
//
//  Copyright (c) 2014-2020 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation


/**
 来自 Alamofire库的 Protected.swift
 */


private protocol XNLock {
    func lock()
    func unlock()
}

extension XNLock {
    /// Executes a closure returning a value while acquiring the lock.
    ///
    /// - Parameter closure: The closure to run.
    ///
    /// - Returns:           The value the closure generated.
    func around<T>(_ closure: () -> T) -> T {
        lock(); defer { unlock() }
        return closure()
    }

    /// Execute a closure while acquiring the lock.
    ///
    /// - Parameter closure: The closure to run.
    func around(_ closure: () -> Void) {
        lock(); defer { unlock() }
        closure()
    }
}


/// 互斥锁
#if os(Linux)
/// A `pthread_mutex_t` wrapper.
final class XNMutexLock: Lock {
    
    private var mutex: UnsafeMutablePointer<pthread_mutex_t>

    init() {
        mutex = .allocate(capacity: 1)

        var attr = pthread_mutexattr_t()
        pthread_mutexattr_init(&attr)
        pthread_mutexattr_settype(&attr, .init(PTHREAD_MUTEX_ERRORCHECK))

        let error = pthread_mutex_init(mutex, &attr)
        precondition(error == 0, "Failed to create pthread_mutex")
    }

    deinit {
        let error = pthread_mutex_destroy(mutex)
        precondition(error == 0, "Failed to destroy pthread_mutex")
    }

    fileprivate func lock() {
        let error = pthread_mutex_lock(mutex)
        precondition(error == 0, "Failed to lock pthread_mutex")
    }

    fileprivate func unlock() {
        let error = pthread_mutex_unlock(mutex)
        precondition(error == 0, "Failed to unlock pthread_mutex")
    }
}
#endif



/// os_unfair_lock锁
#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
/// An `os_unfair_lock` wrapper.
final class XNUnfairLock: XNLock {
    
    private let unfairLock: os_unfair_lock_t

    init() {
        unfairLock = .allocate(capacity: 1)
        unfairLock.initialize(to: os_unfair_lock())
    }

    deinit {
        unfairLock.deinitialize(count: 1)
        unfairLock.deallocate()
    }

    fileprivate func lock() {
        os_unfair_lock_lock(unfairLock)
    }

    fileprivate func unlock() {
        os_unfair_lock_unlock(unfairLock)
    }
}
#endif







/// 线程安全的读写
/// A thread-safe wrapper around a value.
@propertyWrapper
@dynamicMemberLookup
final class XNProtected<T> {
    #if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    private let lock = XNUnfairLock()
    #elseif os(Linux)
    private let lock = XNMutexLock()
    #endif
    private var value: T

    init(_ value: T) {
        self.value = value
    }

    /// The contained value. Unsafe for anything more than direct read or write.
    var wrappedValue: T {
        get { lock.around { value } }
        set { lock.around { value = newValue } }
    }

    var projectedValue: XNProtected<T> { self }

    init(wrappedValue: T) {
        value = wrappedValue
    }

    /// Synchronously read or transform the contained value.
    ///
    /// - Parameter closure: The closure to execute.
    ///
    /// - Returns:           The return value of the closure passed.
    func read<U>(_ closure: (T) -> U) -> U {
        lock.around { closure(self.value) }
    }

    /// Synchronously modify the protected value.
    ///
    /// - Parameter closure: The closure to execute.
    ///
    /// - Returns:           The modified value.
    @discardableResult
    func write<U>(_ closure: (inout T) -> U) -> U {
        lock.around { closure(&self.value) }
    }

    subscript<Property>(dynamicMember keyPath: WritableKeyPath<T, Property>) -> Property {
        get { lock.around { value[keyPath: keyPath] } }
        set { lock.around { value[keyPath: keyPath] = newValue } }
    }
}





extension XNProtected where T: RangeReplaceableCollection {
    /// Adds a new element to the end of this protected collection.
    ///
    /// - Parameter newElement: The `Element` to append.
    func append(_ newElement: T.Element) {
        write { (ward: inout T) in
            ward.append(newElement)
        }
    }

    /// Adds the elements of a sequence to the end of this protected collection.
    ///
    /// - Parameter newElements: The `Sequence` to append.
    func append<S: Sequence>(contentsOf newElements: S) where S.Element == T.Element {
        write { (ward: inout T) in
            ward.append(contentsOf: newElements)
        }
    }

    /// Add the elements of a collection to the end of the protected collection.
    ///
    /// - Parameter newElements: The `Collection` to append.
    func append<C: Collection>(contentsOf newElements: C) where C.Element == T.Element {
        write { (ward: inout T) in
            ward.append(contentsOf: newElements)
        }
    }
}

extension XNProtected where T == Data? {
    /// Adds the contents of a `Data` value to the end of the protected `Data`.
    ///
    /// - Parameter data: The `Data` to be appended.
    func append(_ data: Data) {
        write { (ward: inout T) in
            ward?.append(data)
        }
    }
}
