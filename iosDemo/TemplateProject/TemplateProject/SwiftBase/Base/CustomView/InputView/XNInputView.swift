//
//  XNInputView.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit


/**
 自定义输入框
 */

/**

 func testInput() {
     
     let left = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
     left.backgroundColor = .yellow

     let left1 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 10))
     left1.backgroundColor = .red
     
     let inputView = XNInputView.init(left: left, right: left1)
     view.addSubview(inputView)
     inputView.snp.makeConstraints { make in
         make.top.equalTo(50)
         make.left.equalTo(50)
         make.right.equalTo(-50)
         make.height.equalTo(40)
     }
 }
 
 */

class XNInputView: BaseView {

    var leftView: UIView!
    var rightView: UIView!
    
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var textfield: UITextField = {
        let view = UITextField()
        return view
    }()

    init(left: UIView?, right: UIView?) {
        self.leftView = left
        self.rightView = right
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //手动配置, 针对没有调用 init(left, right)创建的inputview， 需要重新执行commonInit
    func config(left: UIView, right: UIView) {
        self.leftView = left
        self.rightView = right
        commonInit()
    }
    
    override func commonInit() {
        if leftView == nil || rightView == nil {
            return
        }
        super.commonInit()
    }
    
    override func setupSubview() {
        addSubview(bgImageView)
        addSubview(leftView)
        addSubview(textfield)
        addSubview(rightView)
    }
    
    override func setupConstraint() {
        
        bgImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    
        self.textfield.snp.makeConstraints { make in
            make.left.equalTo(leftView.snp.right)
            make.right.equalTo(rightView.snp.left)
            make.centerY.equalTo(leftView)
            make.height.equalTo(32)
        }
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if leftView == nil || rightView == nil {
            return
        }
        
        let selfSize = bounds.size
        
        //如果leftView或rightView设置了frame，则直接使用frame.size
        var leftSize = leftView.size
        if leftSize == CGSize.zero {
            leftSize = leftView.intrinsicContentSize
        }
        var rightSize = rightView.size
         if rightSize == CGSize.zero {
             rightSize = rightView.intrinsicContentSize
         }
        
        var leftFrame = CGRect.zero
        var rightFrame = CGRect.zero
        
        leftFrame.origin.x = 0
        leftFrame.origin.y = (selfSize.height - leftSize.height) / 2.0
        leftFrame.size = leftSize
        
        rightFrame.origin.x = selfSize.width - rightSize.width
        rightFrame.origin.y = (selfSize.height - rightSize.height) / 2.0
        rightFrame.size = rightSize
        
        leftView.frame = leftFrame
        rightView.frame = rightFrame
        
    }
    
}
