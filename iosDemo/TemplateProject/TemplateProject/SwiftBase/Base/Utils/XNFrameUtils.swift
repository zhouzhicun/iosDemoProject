//
//  FrameUtils.swift
//  MaxiBas_Platfrom
//
//  Created by zzc on 2020/8/27.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit

/**
 屏幕相关尺寸
 */
class XNFrameUtils {
    
    static func safeAreaInsets() -> UIEdgeInsets {
        
        let app = UIApplication.shared
        let statusFrame = app.statusBarFrame
        let hasBar = !app.isStatusBarHidden
        
        var safeAreaInsets = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            if let window = app.delegate?.window {
                safeAreaInsets = window?.safeAreaInsets ?? UIEdgeInsets.zero
            }
        }
        
        if hasBar && safeAreaInsets.top == 0.0 {
            safeAreaInsets.top = statusFrame.size.height
        }
        
        return safeAreaInsets
        
    }
    
    
    static func statusBarHeight() -> CGFloat {
        return safeAreaInsets().top
    }
    
    static func navigationBarHeight() -> CGFloat {
        return 44.0
    }
    
    static func statusAndNavBarHeight() -> CGFloat {
        return safeAreaInsets().top + navigationBarHeight()
    }
    
    static func tabBarHeight() -> CGFloat {
        return safeAreaInsets().bottom + 49.0
    }
    
    static func bottomSafeArea() -> CGFloat {
        return safeAreaInsets().bottom
    }
    
    
}
