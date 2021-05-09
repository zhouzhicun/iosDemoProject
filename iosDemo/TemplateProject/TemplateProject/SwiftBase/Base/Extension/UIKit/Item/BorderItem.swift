//
//  BorderItem.swift
//  swiftApp
//
//  Created by zzc on 2020/7/8.
//  Copyright © 2020 zzc. All rights reserved.
//

import UIKit
import Foundation

/**
 边框设置
 边宽 + 颜色 + 圆角
 */
struct BorderItem {
    var width: Float?
    var color: UIColor?
    var radius: Float?
    
    init(_ width: Float?,
         _ color: UIColor?,
         _ radius: Float? = nil) {
        self.width = width
        self.color = color
        self.radius = radius
    }
}
