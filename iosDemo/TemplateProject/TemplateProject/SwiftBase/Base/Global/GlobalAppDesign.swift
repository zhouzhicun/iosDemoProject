//
//  GlobalAppDesign.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import SwifterSwift

// MARK: UX全局变量
struct UX {}

extension UX {
    
    struct Global {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height
    }
}


