//
//  ContentLoader
//  Copyright (c) 2019 alberdev. All rights reserved.
//  Partially copy/pasted from https://github.com/jameslintaylor/AssociatedObjects/blob/master/AssociatedObjects/AssociatedObjects.swift
//
import Foundation


/**
 关联引用
 来源 EmptyStateKit库的 AssociationPolicy.swift
 */



enum XNAssociationPolicy: UInt {
    // raw values map to objc_AssociationPolicy's raw values
    case assign = 0
    case copy = 771
    case copyNonatomic = 3
    case retain = 769
    case retainNonatomic = 1
    
    var objc: objc_AssociationPolicy {
        return objc_AssociationPolicy(rawValue: rawValue)!
    }
}

protocol XNAssociatedObjects: class { }

// transparent wrappers
extension XNAssociatedObjects {
    
    
    /// wrapper around `objc_getAssociatedObject`
    func ao_get(pkey: UnsafeRawPointer) -> Any? {
        return objc_getAssociatedObject(self, pkey)
    }
    
    /// wrapper around `objc_setAssociatedObject`
    func ao_setOptional(_ value: Any?, pkey: UnsafeRawPointer, policy: XNAssociationPolicy = .retainNonatomic) {
        guard let value = value else { return }
        objc_setAssociatedObject(self, pkey, value, policy.objc)
    }
    
    /// wrapper around `objc_setAssociatedObject`
    func ao_set(_ value: Any, pkey: UnsafeRawPointer, policy: XNAssociationPolicy = .retainNonatomic) {
        objc_setAssociatedObject(self, pkey, value, policy.objc)
    }
    
    /// wrapper around 'objc_removeAssociatedObjects'
    func ao_removeAll() {
        objc_removeAssociatedObjects(self)
    }
}

extension NSObject: XNAssociatedObjects { }
