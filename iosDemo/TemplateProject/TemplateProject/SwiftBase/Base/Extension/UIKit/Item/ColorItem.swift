//
//  Color.swift
//  swiftApp
//
//  Created by zzc on 2020/7/8.
//  Copyright © 2020 zzc. All rights reserved.
//

import UIKit
import Foundation

/**
颜色：normal(正常) + high(高亮) + selected(选中) + disable(禁用)
常用于button背景色设置
*/

struct ColorItem {
    
    var normal: UIColor?
    var highlight: UIColor?
    var selected: UIColor?
    var disable: UIColor?
    
    
    init(allColor: UIColor?) {
        self.normal = allColor
        self.highlight = allColor
        self.selected = allColor
        self.disable = allColor
    }
    
    init(_ normal: UIColor?,
         _ highlight: UIColor?,
         _ selected: UIColor?,
         _ disable: UIColor?) {
        
        self.normal = normal
        self.highlight = highlight
        self.selected = selected
        self.disable = disable
    }
}
