//
//  BaseTableViewCell.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    

    
    // MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        
        //默认配置
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
     绑定Model
     */
    func bindModel(_ model: Any?) {}
    
    /**
     cell固定高度
     */
    class func cellHeight() -> CGFloat {
        return CGFloat(0)
    }
    
    
    // MARK: 默认配置
    private func defaultConfig() {
        self.backgroundColor = .white
        self.textLabel?.isHidden = true
        self.detailTextLabel?.isHidden = true
        self.selectionStyle = .none
    }
}
