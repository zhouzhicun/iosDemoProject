//
//  ImageItem.swift
//  swiftApp
//
//  Created by zzc on 2020/7/8.
//  Copyright © 2020 zzc. All rights reserved.
//

import UIKit
import Foundation

/**
图片：normal(正常) + high(高亮) + selected(选中) + disable(禁用)
常用于button图标或背景图设置
*/

struct ImageItem {
    var normal: UIImage?
    var highlight: UIImage?
    var selected: UIImage?
    var disable: UIImage?
    
    init(allImage: UIImage?) {
        self.normal = allImage
        self.highlight = allImage
        self.selected = allImage
        self.disable = allImage
    }
    
    init(_ normal: UIImage?,
         _ highlight: UIImage?,
         _ selected: UIImage?,
         _ disable: UIImage?) {
        self.normal = normal
        self.highlight = highlight
        self.selected = selected
        self.disable = disable
    }
    

}
