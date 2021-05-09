//
//  BaseCollectionViewCell.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        defaultConfig()
        setupSubview()
        setupConstraint()
        setupEvent()
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
     UI事件处理
     */
    func setupEvent() {}
    
    /**
     绑定model
     */
    func bindModel(_ model: Any?) {}
    
    
    /**
     item固定size
     */
    class func itemSize() -> CGSize {
        return .zero
    }
    
    
    
    
    // MARK: 私有方法
    
    /**
     默认设置
     */
    private func defaultConfig() {
        backgroundColor = .white
    }
}
