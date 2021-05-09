//
//  BaseView.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    /**
     背景Layer
     */
    var backgroundLayer: CALayer?
    
    
    /// 纯代码开发
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    /// xib开发
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit() {
        backgroundColor = .white
        setupSubview()
        setupConstraint()
        setupEvent()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let curBGLayer = backgroundLayer else { return }
        let curBounds = self.bounds
        curBGLayer.frame = curBounds
    }
    
    
    /**
     添加背景, 包括渐变背景
     */
    func addBGLayer(_ layer: CALayer) {
        backgroundLayer = layer
        self.layer.insertSublayer(layer, at: 0)
    }
    

    // MARK: 模板方法，子类重写

    /**
     添加subView
     */
    func setupSubview() {}
    
    /**
     设置约束
     */
    func setupConstraint() {}
    
    /**
     UI时间处理
     */
    func setupEvent() {}
    
    /**
     绑定model,填充数据
     */
    func bindModel(_ model: Any?) {}
    
    
    /**
     view固定高度
     */
    class func viewHeight() -> CGFloat {
        return CGFloat(0)
    }

}
