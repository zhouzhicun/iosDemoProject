//
//  UIView+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit
import SnapKit

extension UIView
{
    /**
     设置边框,圆角
     */
    func setBorder(borderItem: BorderItem) {
        
        //边框
        if let width = borderItem.width, let color = borderItem.color {
            self.layer.borderWidth = CGFloat(width)
            self.layer.borderColor = color.cgColor
        }
        
        //圆角
        if let radius = borderItem.radius {
            setCorner(radius: radius)
        }
    }
    
    func setCorner(radius: Float) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.masksToBounds = true
    }
    
    func setCorner(radius: Float, corners: UIRectCorner) {
        
        //很重要，必须先布局，得到最终的bounds
        layoutIfNeeded()
        
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: CGFloat(radius), height: CGFloat(radius)))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        
        self.layer.mask = maskLayer
    }
}


extension UIView
{
    
    /**
     计算size
     */
    func calcSize() -> CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        let size = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return size
    }
    
    /**
     从nib加载
     */
    class func loadFromNib() -> UIView? {
        let name = String(describing: self)
        return UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}

extension UIView
{
    /**
     superView：父view
     prevView：上一个view
     show：是否显示
     */
    func createConstraint(superView: UIView, prevView: inout UIView, show: Bool, closure: (_ make: ConstraintMaker, _ prevView: UIView) -> Void) {
        
        self.removeFromSuperview()
        if !show { return }
        
        superView.addSubview(self)
        self.snp.remakeConstraints { make in
            closure(make, prevView)
        }
        prevView = self
    }
}
