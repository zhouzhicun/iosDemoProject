//
//  XNFixSizeButton.swift
//  MaxiAp200_Battery
//
//  Created by zzc on 2020/7/21.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit

/**
 固定frame的button, 只限于当行文本
 使用静态方法创建button
 */

/**
 
 func testTop() {
     var btn1 = XNFixSizeButton.top(order: .image_title, padding: 10, space: 20)
     var btn2 = XNFixSizeButton.top(order: .title_image, padding: 10, space: 20)
     handle(button: btn1)
     handle(button: btn2)
     
     
     btn1.frame = CGRect(x: 100, y: 50, width: 200, height: 140)
     btn2.frame = CGRect(x: 100, y: 200, width: 200, height: 140)
     
     self.view.addSubview(btn1)
     self.view.addSubview(btn2)
     
 }
 
 func handle(button: XNFixSizeButton) {
     button.setTitle(titleItem: TextItem("hello，换换换行符", .regular(18), .black), state: .normal)
     button.setImage(UIImage(named: "Me_BoxManagement"), for: .normal)
     button.setBorder(borderItem: BorderItem(1, .black))
 }
 
 */


@objc
class XNFixSizeButton: XNBaseButton {
    
    //排列顺序
    var arrangeOrder: XNButtonSubviewArrangeOrder
    
    //布局类型
    var layoutType: XNButtonContentLayoutType
    
    var padding: CGFloat    //边距
    var space: CGFloat      //间距
    
    fileprivate init(layout: XNButtonContentLayoutType, order: XNButtonSubviewArrangeOrder, space: CGFloat, padding: CGFloat) {
        self.layoutType = layout
        self.arrangeOrder = order
        self.space = space
        self.padding = padding
        
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch layoutType {
            
        case .center_horizontal, .left, .right: //水平布局
            layout_horizontal()
            
        case .center_vertical, .top, .bottom:  //垂直布局
            layout_vertical()
        }
    }
    
    
 
    
}



//MARK: 布局
extension XNFixSizeButton {
    
    private func layout_horizontal() {
         
         let title = titleLabel?.intrinsicContentSize
         let image = imageView?.intrinsicContentSize
         let titleSize = title ?? CGSize.zero
         let imageSize = image ?? CGSize.zero

         let selfSize = self.bounds.size
         
         //title和image之间的间距
         let spaceValue = space
         
         //计算左边距
         var leftPadding: CGFloat = 0.0
         switch layoutType {
         case .center_horizontal:
             leftPadding = (selfSize.width - titleSize.width - imageSize.width - spaceValue) / 2.0
         case .left:
             leftPadding = padding
         case .right:
             leftPadding = selfSize.width - titleSize.width - imageSize.width - spaceValue - padding
         default:
             break
         }
         
         var titleFrame = CGRect.zero
         var imageFrame = CGRect.zero
         
         switch arrangeOrder {
         case .title_image:
             titleFrame.origin.x = leftPadding
             titleFrame.origin.y = (selfSize.height - titleSize.height) / 2.0
             titleFrame.size = titleSize
             
             imageFrame.origin.x = leftPadding + titleSize.width + spaceValue
             imageFrame.origin.y = (selfSize.height - imageSize.height) / 2.0
             imageFrame.size = imageSize

         case .image_title:

             imageFrame.origin.x = leftPadding
             imageFrame.origin.y = (selfSize.height - imageSize.height) / 2.0
             imageFrame.size = imageSize
             
             titleFrame.origin.x = leftPadding + imageSize.width + spaceValue
             titleFrame.origin.y = (selfSize.height - titleSize.height) / 2.0
             titleFrame.size = titleSize
             
         }
         
         titleLabel?.frame = titleFrame
         imageView?.frame = imageFrame
     }
     
     private func layout_vertical() {
         
         let title = titleLabel?.intrinsicContentSize
         let image = imageView?.intrinsicContentSize
         let titleSize = title ?? CGSize.zero
         let imageSize = image ?? CGSize.zero
         
         let selfSize = self.bounds.size
         
         //title和image之间的间距
         let spaceValue = space
         
         //计算顶部边距
         var topPadding: CGFloat = 0.0
         switch layoutType {
         case .center_vertical:
             topPadding = (selfSize.height - titleSize.height - imageSize.height - spaceValue) / 2.0
         case .top:
             topPadding = padding
         case .bottom:
             topPadding = selfSize.height - titleSize.height - imageSize.height - spaceValue - padding
         default:
             break
         }
         
         var titleFrame = CGRect.zero
         var imageFrame = CGRect.zero
         
         switch arrangeOrder {
             case .title_image:
                 titleFrame.origin.x = (selfSize.width - titleSize.width) / 2.0
                 titleFrame.origin.y = topPadding
                 titleFrame.size = titleSize
                 
                 imageFrame.origin.x = (selfSize.width - imageSize.width) / 2.0
                 imageFrame.origin.y = topPadding + titleSize.height + spaceValue
                 imageFrame.size = imageSize

             case .image_title:

                 imageFrame.origin.x = (selfSize.width - imageSize.width) / 2.0
                 imageFrame.origin.y = topPadding
                 imageFrame.size = imageSize
                 
                 titleFrame.origin.x = (selfSize.width - titleSize.width) / 2.0
                 titleFrame.origin.y = topPadding + imageSize.height + spaceValue
                 titleFrame.size = titleSize
                 
             }
             
             titleLabel?.frame = titleFrame
             imageView?.frame = imageFrame
     }
}






//MARK: 类方法

////布局方式
//enum XNButtonContentLayoutType {
//    case horizontal_center  //水平居中
//    case vertical_center    //垂直居中
//    case left               //左对齐
//    case right              //右对齐
//    case top                //顶对齐
//    case bottom             //底对齐
//}

extension XNFixSizeButton
{
    //水平居中
    @objc
    static func center_horizontal(order: XNButtonSubviewArrangeOrder, space: CGFloat) -> XNFixSizeButton {
        return XNFixSizeButton(layout: .center_horizontal, order: order, space: space, padding: 0)
    }
    
    //垂直居中
    @objc
    static func center_vertical(order: XNButtonSubviewArrangeOrder, space: CGFloat) -> XNFixSizeButton {
        return XNFixSizeButton(layout: .center_vertical, order: order, space: space, padding: 0)
    }
    
    //左对齐
    @objc
    static func left(order: XNButtonSubviewArrangeOrder, padding: CGFloat, space: CGFloat) -> XNFixSizeButton {
        return XNFixSizeButton(layout: .left, order: order, space: space, padding: padding)
    }
    
    //右对齐
    @objc
    static func right(order: XNButtonSubviewArrangeOrder, padding: CGFloat, space: CGFloat) -> XNFixSizeButton {
        return XNFixSizeButton(layout: .right, order: order, space: space, padding: padding)
    }
    
    //顶对齐
    @objc
    static func top(order: XNButtonSubviewArrangeOrder, padding: CGFloat, space: CGFloat) -> XNFixSizeButton {
        return XNFixSizeButton(layout: .top, order: order, space: space, padding: padding)
    }
    
    //底对齐
    @objc
    static func bottom(order: XNButtonSubviewArrangeOrder, padding: CGFloat, space: CGFloat) -> XNFixSizeButton {
        return XNFixSizeButton(layout: .bottom, order: order, space: space, padding: padding)
    }
    
}
