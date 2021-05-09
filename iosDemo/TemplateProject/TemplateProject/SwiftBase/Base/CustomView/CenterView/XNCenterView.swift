//
//  XNCenterView.swift
//  MaxiAp200_Platfrom
//
//  Created by zzc on 2020/7/22.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit

/**
自定义居中view
*/

/**
 func testCenterView() {
     
     var view1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
     view1.backgroundColor = .yellow
     
     var view2 = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
     view2.backgroundColor = .red
     
     var centerView1 = XNCenterView(first: view1, second: view2, direct: .vertical, space: 20)
     
     view.addSubview(centerView1)
     centerView1.snp.makeConstraints { make in
         make.top.equalTo(50)
         make.centerX.equalTo(self.view)
     }
 }
 */

enum XNCenterArrangeDirection {
    case horizontal      //水平
    case vertical        //垂直
}

class XNCenterView: BaseView {
    
    var firstView: UIView
    var secondView: UIView
    var direction: XNCenterArrangeDirection
    var space: CGFloat
    
    init(first: UIView, second: UIView, direct:XNCenterArrangeDirection, space: CGFloat) {
        
        self.firstView = first
        self.secondView = second
        self.direction = direct
        self.space = space
        
        super.init(frame: CGRect.zero)
    }
    
    override func setupSubview() {
        addSubview(self.firstView)
        addSubview(self.secondView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            
            var firstSize  = firstView.intrinsicContentSize
            if firstSize.width <= 0 || firstSize.height <= 0 {
                firstSize = firstView.size
            }
            
            var secondSize = secondView.intrinsicContentSize
            if secondSize.width <= 0 || secondSize.height <= 0 {
                secondSize = secondView.size
            }

            switch direction {
            case .horizontal:
                let maxHeight = max(firstSize.height, secondSize.height)
                return CGSize(width: firstSize.width + secondSize.width + space, height: maxHeight)
                
            case .vertical:
                let maxWidth = max(firstSize.width, secondSize.width)
                return CGSize(width: maxWidth, height: firstSize.height + secondSize.height + space)
            }
            
        }
    }
      
      override func layoutSubviews() {
          
          super.layoutSubviews()
          
          let selfSize = bounds.size
          var firstSize  = firstView.intrinsicContentSize
          if firstSize.width <= 0 || firstSize.height <= 0 {
              firstSize = firstView.size
          }
          
          var secondSize = secondView.intrinsicContentSize
          if secondSize.width <= 0 || secondSize.height <= 0 {
              secondSize = secondView.size
          }
          
          var firstFrame = CGRect.zero
          var secondFrame = CGRect.zero
          
          
          switch direction {
          case .horizontal:
               firstFrame.origin.x = 0
               firstFrame.origin.y = (selfSize.height - firstSize.height) / 2.0
               firstFrame.size = firstSize

               secondFrame.origin.x = selfSize.width - secondSize.width
               secondFrame.origin.y = (selfSize.height - secondSize.height) / 2.0
               secondFrame.size = secondSize

          case .vertical:
              firstFrame.origin.x = (selfSize.width - firstSize.width) / 2.0
              firstFrame.origin.y = 0
              firstFrame.size = firstSize
              
              secondFrame.origin.x = (selfSize.width - secondSize.width) / 2.0
              secondFrame.origin.y = selfSize.height - secondSize.height
              secondFrame.size = secondSize
          }
          
          firstView.frame = firstFrame
          secondView.frame = secondFrame
          
      }
}
