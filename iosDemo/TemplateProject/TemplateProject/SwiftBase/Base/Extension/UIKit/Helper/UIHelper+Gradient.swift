//
//  UIHelper+Gradient.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

@objc
enum GradientDirection: Int {
    
    /**
     中线
     */
    case top_bottom         //上 -> 下
    case bottom_top         //下 -> 上
    case left_right         //左 -> 右
    case right_left         //右 -> 左
    
    /**
     对角线
     */
    case topLeft_bottomRight    //左顶 -> 右下
    case topRight_bottomLeft    //右顶 -> 左下
    case bottomLeft_topRight    //左底 -> 右上
    case bottomRight_topLeft    //右底 -> 左上
    
}


extension UIHelper
{
    /**
     设置渐变方向
     */
    static func setGradientDirection(_ gradientLayer: CAGradientLayer, direction: GradientDirection) {
        switch direction {
        case .top_bottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .bottom_top:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .left_right:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .right_left:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .topLeft_bottomRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .topRight_bottomLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .bottomLeft_topRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .bottomRight_topLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

        }
    }
    
    
    /**
     colors：颜色数组
     locations：位置数组, 默认为nil，即均匀渐变
     direction: 方向，默认从上到下
     */
    static func createGradientLayer(_ colors: [UIColor],
                                    locations: [NSNumber]? = nil,
                                    direction: GradientDirection = .top_bottom) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        setGradientDirection(gradientLayer, direction: direction)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.type = .axial
        return gradientLayer
    }

    static func aaa() -> CAGradientLayer {
        let layer = createGradientLayer([.black, .white], locations: nil)
        return layer
    }
}





