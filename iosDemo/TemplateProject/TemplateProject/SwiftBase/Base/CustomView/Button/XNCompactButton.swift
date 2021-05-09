//
//  XNBaseButton.swift
//  MaxiAp200_Battery
//
//  Created by zzc on 2020/7/21.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit


/**
 紧凑型按钮, 只限于单行文本
 */

/**
 lazy var statusButton: XNCompactButton = {
     let button = XNCompactButton.horizontal(order: .image_title, space: 2)
     button.setAllTitle(titleItem: TextItem("已连接", .regular(14), UIColor(hexString: "#464646")))
     let normal = UIImage(named: "")
     let selected = UIImage(named: "")
     button.setAllImage(imageItem: ImageItem(normal, nil, selected, nil))
     return button
 }()
 */

@objc
class XNCompactButton: XNBaseButton {
    
    //排列顺序
    var arrangeOrder: XNButtonSubviewArrangeOrder
    
    //方向
    var arrangeDirect: XNButtonSubviewArrangeDirection
    
    //间距
    var space: CGFloat
    
     fileprivate init(arrangeDirect: XNButtonSubviewArrangeDirection,  arrangeOrder: XNButtonSubviewArrangeOrder, space: CGFloat = 0) {
        self.arrangeDirect = arrangeDirect
        self.arrangeOrder = arrangeOrder
        self.space = space
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            
            let image = imageView?.intrinsicContentSize
            let text  = titleLabel?.intrinsicContentSize
            let imageSize = image ?? CGSize.zero
            let textSize  = text ?? CGSize.zero

            switch arrangeDirect {
            case .horizontal:
                let maxHeight = max(imageSize.height, textSize.height)
                return CGSize(width: imageSize.width + textSize.width + space, height: maxHeight)
                
            case .vertical:
                let maxWidth = max(imageSize.width, textSize.width)
                return CGSize(width: maxWidth, height: imageSize.height + textSize.height + space)

            }

        }
    }
    

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let selfSize = bounds.size
        let image = imageView?.intrinsicContentSize
        let title  = titleLabel?.intrinsicContentSize
        let imageSize = image ?? CGSize.zero
        let titleSize  = title ?? CGSize.zero
        
        var imageFrame = CGRect.zero
        var titleFrame = CGRect.zero
        
        
        switch (arrangeDirect, arrangeOrder) {
        case (.horizontal, .image_title):
             imageFrame.origin.x = 0
             imageFrame.origin.y = (selfSize.height - imageSize.height) / 2.0
             imageFrame.size = imageSize

             titleFrame.origin.x = selfSize.width - titleSize.width
             titleFrame.origin.y = (selfSize.height - titleSize.height) / 2.0
             titleFrame.size = titleSize
        
        case (.horizontal, .title_image):
            titleFrame.origin.x = 0
            titleFrame.origin.y = (selfSize.height - titleSize.height) / 2.0
            titleFrame.size = titleSize
            
            imageFrame.origin.x = selfSize.width - imageSize.width
            imageFrame.origin.y = (selfSize.height - imageFrame.height) / 2.0
            imageFrame.size = imageSize
        
        case (.vertical, .image_title):
            imageFrame.origin.x = (selfSize.width - imageSize.width) / 2.0
            imageFrame.origin.y = 0
            imageFrame.size = imageSize
            
            titleFrame.origin.x = (selfSize.width - titleSize.width) / 2.0
            titleFrame.origin.y = selfSize.height - titleSize.height
            titleFrame.size = titleSize
            
        case (.vertical, .title_image):
            titleFrame.origin.x = (selfSize.width - titleSize.width) / 2.0
            titleFrame.origin.y = 0
            titleFrame.size = titleSize
            
            imageFrame.origin.x = (selfSize.width - imageFrame.width) / 2.0
            imageFrame.origin.y = selfSize.height - imageFrame.height
            imageFrame.size = imageSize
        
        }
        
        imageView?.frame = imageFrame
        titleLabel?.frame = titleFrame
        
    }
    
}


//MARK: 类方法

extension XNCompactButton {
    
    @objc
    static func horizontal(order: XNButtonSubviewArrangeOrder, space: CGFloat) -> XNCompactButton {
        let button = XNCompactButton(arrangeDirect:.horizontal, arrangeOrder:order, space:space)
        return button
    }

    @objc
    static func vertical(order: XNButtonSubviewArrangeOrder, space: CGFloat) -> XNCompactButton {
        let button = XNCompactButton(arrangeDirect:.vertical, arrangeOrder:order, space:space)
        return button
    }
    
}
