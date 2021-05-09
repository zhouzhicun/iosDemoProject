//
//  CallbackQueue.swift
//  Kingfisher
//


import Foundation

/**
 源于 Kingfisher库的 CallbackQueue.swift
 */

public typealias DispatchBlock = ()-> Void;

public enum XNCallbackQueue {
    
    /// 主线程异步
    case mainAsync
    
    /// 主线程同步
    case mainSync
    
    /// 直接执行
    case untouch
    
    /// 异步执行
    case async(DispatchQueue)
    
    /// 延迟执行
    case delay(DispatchQueue, TimeInterval)
    
    
    public func execute(_ block: @escaping DispatchBlock) {
        switch self {
        case .mainAsync:
            DispatchQueue.main.async { block() }
        case .mainSync:
            DispatchQueue.main.mainSync(block)
        case .untouch:
            block()
        case .async(let queue):
            queue.async { block() }
        case .delay(let queue, let seconds):
            queue.delay(seconds: seconds, block: block)
        }
    }
}


@nonobjc
extension DispatchQueue {

    //主线程同步执行
    func mainSync(_ block: @escaping DispatchBlock ) {
        if self === DispatchQueue.main && Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.sync { block() }
        }
    }
    
    //延迟执行
    func delay(seconds: TimeInterval, block: @escaping DispatchBlock) {
        asyncAfter(deadline: .now() + seconds, execute: block);
    }
    
}


