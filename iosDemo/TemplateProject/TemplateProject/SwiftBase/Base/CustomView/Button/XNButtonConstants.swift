//
//  XNButtonConstants.swift
//  MaxiAp200_Battery
//
//  Created by zzc on 2020/7/21.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation


//subview排列方向
@objc
enum XNButtonSubviewArrangeDirection: Int {
    case horizontal = 0     //水平
    case vertical           //垂直
}


//subview排列顺序
@objc
enum XNButtonSubviewArrangeOrder: Int {
    case title_image = 0     //title 先于 image
    case image_title         //image 先于 title
}


//布局方式
@objc
enum XNButtonContentLayoutType: Int {
    case center_horizontal = 0  //水平居中
    case center_vertical    //垂直居中
    case left               //左对齐
    case right              //右对齐
    case top                //顶对齐
    case bottom             //底对齐
}
