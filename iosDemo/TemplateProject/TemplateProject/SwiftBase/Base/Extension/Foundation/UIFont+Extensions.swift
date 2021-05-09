//
//  UIFont+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

extension UIFont {
    
    // MARK: 获取字体
    class func regular(_ size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: defalutScaleSize(size), weight: .regular)
    }
    
    class func medium(_ size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: defalutScaleSize(size), weight: .medium)
    }
    
    // MARK: 字体缩放适配
    class func customScaleSize(_ size: CGFloat) -> CGFloat {
        var scaleSize = size
        let width = XNScreenWidth()
        if width >= 414 {
            scaleSize += 2.0
        }
        return scaleSize
    }
    
    class func defalutScaleSize(_ size: CGFloat) -> CGFloat {
        return XNScale(size)
    }
}
