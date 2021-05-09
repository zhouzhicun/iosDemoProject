//
//  TextItem.swift
//  swiftApp
//
//  Created by zzc on 2020/7/8.
//  Copyright © 2020 zzc. All rights reserved.
//

import UIKit
import Foundation

/**
 文本，字体，颜色，url
 */
struct TextItem {
    var text: String?
    var font: UIFont?
    var color: UIColor?
    var url: String?
    
    init(_ text: String?,
         _ font: UIFont?,
         _ color: UIColor?,
         _ url: String? = nil) {
        
        self.text = text
        self.font = font
        self.color = color
        self.url = url
    }
    
    
}

