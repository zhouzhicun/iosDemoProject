//
//  CommonCell.swift
//  MaxiAp200_Battery
//
//  Created by zzc on 2020/7/21.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit

/**
 
 使用时，需子类化
 
 cell样式：
 
 icon | title | value | arrow
 
 */

enum CommonCellStyle {
    case title(titlePadding:CGFloat)
    case title_value(titlePadding:CGFloat, valuePadding:CGFloat)
    case title_arrow(titlePadding:CGFloat, arrowPadding:CGFloat)
    case title_value_arrow(titlePadding:CGFloat, arrowPadding:CGFloat, valuePadding: CGFloat)
    case icon_title_value(iconPadding:CGFloat, titlePadding:CGFloat, valuePadding:CGFloat)
    case icon_title_value_arrow(iconPadding:CGFloat, titlePadding:CGFloat, valuePadding:CGFloat, arrowPadding:CGFloat)
}


class CommonCell: BaseTableViewCell {
    
    /**
     图标
     */
    lazy var iconImageView: UIImageView = {
        return UIImageView()
    }()
    
    /**
     标题
     */
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setTextItem(TextItem(nil, .regular(17), UIColor(hexString: "#333333")))
        return label
    }()
    
    /**
     值
     */
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.setTextItem(TextItem(nil, .regular(17), UIColor(hexString: "#333333")))
        return label
    }()
    
    /**
     箭头
     */
    lazy var arrowButton: UIButton = {
        return UIButton()
    }()
    

    /**
     按钮点击事件处理
     */
    func addArrowEvent() {
        arrowButton.addTarget(self, action: #selector(handleArrowEvent), for: .touchUpInside)
    }
    
    @objc func handleArrowEvent() {}
}


extension CommonCell {

    /**
     配置样式
     */
    func configStyle(_ style: CommonCellStyle) {
        
        switch style {
        case .title(let titlePadding):
            layout_title(titlePadding)
            
        case .title_value(let titlePadding, let valuePadding):
            layout_title_value(titlePadding, valuePadding)
            
        case .title_arrow(let titlePadding, let arrowPadding):
            layout_title_arrow(titlePadding, arrowPadding)
            
        case .title_value_arrow(let titlePadding, let arrowPadding, let valuePadding):
            layout_title_value_arrow(titlePadding, arrowPadding, valuePadding)
  
        case .icon_title_value(let iconPadding, let titlePadding, let valuePadding):
            layout_icon_title_value(iconPadding, titlePadding, valuePadding)
            
        case .icon_title_value_arrow(let iconPadding, let titlePadding, let valuePadding, let arrowPadding):
            layout_icon_title_value_arrow(iconPadding, titlePadding, valuePadding, arrowPadding)
        }
    }
}


extension CommonCell {
    
    /**
     title
     */
    func layout_title(_ titlePadding: CGFloat) {
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.remakeConstraints { make in
            make.left.equalTo(contentView).offset(titlePadding)
            make.centerY.equalTo(contentView)
        }
    }
    
    /**
     title + value
     */
    func layout_title_value(_ titlePadding: CGFloat, _ valuePadding: CGFloat) {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        
        titleLabel.snp.remakeConstraints { make in
            make.left.equalTo(contentView).offset(titlePadding)
            make.centerY.equalTo(contentView)
        }
        valueLabel.snp.remakeConstraints { make in
            make.right.equalTo(contentView).offset(-valuePadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
    }
    
    /**
     title + arrow
     */
    func layout_title_arrow(_ titlePadding: CGFloat, _ arrowPadding: CGFloat) {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowButton)
        addArrowEvent()
        
        titleLabel.snp.remakeConstraints { make in
            make.left.equalTo(contentView).offset(titlePadding)
            make.centerY.equalTo(contentView)
        }
        arrowButton.snp.remakeConstraints { make in
            make.right.equalTo(contentView).offset(-arrowPadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
        
    }
    
    /**
     title + value + arrow
     */
    func layout_title_value_arrow(_ titlePadding: CGFloat, _ arrowPadding: CGFloat, _ valuePadding: CGFloat) {

        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(arrowButton)
        addArrowEvent()
        
        titleLabel.snp.remakeConstraints { make in
            make.left.equalTo(contentView).offset(titlePadding)
            make.centerY.equalTo(contentView)
        }
        arrowButton.snp.remakeConstraints { make in
            make.right.equalTo(contentView).offset(-arrowPadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
        valueLabel.snp.remakeConstraints { make in
            make.right.equalTo(arrowButton.snp.left).offset(-valuePadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
    }
    
    
    /**
     icon + title + value
     */
    func layout_icon_title_value(_ iconPadding: CGFloat, _ titlePadding: CGFloat, _ valuePadding: CGFloat) {
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        
        iconImageView.snp.remakeConstraints { make in
            make.left.equalTo(contentView).offset(iconPadding)
            make.centerY.equalTo(contentView)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(titlePadding)
            make.centerY.equalTo(contentView)
        }
        valueLabel.snp.remakeConstraints { make in
            make.right.equalTo(contentView).offset(-valuePadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
    }
    
    /**
     icon + title + value + arrow
     */
    func layout_icon_title_value_arrow(_ iconPadding: CGFloat, _ titlePadding: CGFloat, _ valuePadding: CGFloat, _ arrowPadding: CGFloat) {
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(arrowButton)
        
        addArrowEvent()

        iconImageView.snp.remakeConstraints { make in
            make.left.equalTo(contentView).offset(iconPadding)
            make.centerY.equalTo(contentView)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(titlePadding)
            make.centerY.equalTo(contentView)
        }
        
        arrowButton.snp.remakeConstraints { make in
            make.right.equalTo(contentView).offset(-arrowPadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
        
        valueLabel.snp.remakeConstraints { make in
            make.right.equalTo(arrowButton.snp.left).offset(-valuePadding).priority(.medium)
            make.centerY.equalTo(contentView)
        }
    }
    
}
