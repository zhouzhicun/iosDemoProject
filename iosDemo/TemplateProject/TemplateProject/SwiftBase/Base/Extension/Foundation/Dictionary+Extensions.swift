//
//  NSDictionary+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation

extension Dictionary {
    
   mutating func safeInsert(_ value: Value?, key: Key) {
        if value == nil {
            removeValue(forKey: key)
        } else {
            updateValue(value!, forKey: key)
        }
    }
}
