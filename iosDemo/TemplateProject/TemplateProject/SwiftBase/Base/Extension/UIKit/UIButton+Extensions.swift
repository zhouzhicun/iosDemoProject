//
//  UIButton+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

// MARK: title
extension UIButton
{
    //设置单状态Title
    func setTitle(titleItem: TextItem, state: UIControl.State) {
        self.titleLabel?.font = titleItem.font
        setTitle(titleItem.text, for: state)
        setTitleColor(titleItem.color, for: state)
    }
    
    
    //设置全状态Title
    func setAllTitle(titleItem: TextItem) {
        setTitle(titleItem: titleItem, state: .normal)
        setTitle(titleItem: titleItem, state: .highlighted)
        setTitle(titleItem: titleItem, state: .selected)
        setTitle(titleItem: titleItem, state: .disabled)
    }

    
    func setAllTitle(title: String) {
        setTitle(title, for: .normal)
        setTitle(title, for: .highlighted)
        setTitle(title, for: .selected)
        setTitle(title, for: .disabled)
    }
}


// MARK: Icon图标
extension UIButton {
    
    
    //设置全状态图标
    func setAllIcon(_ imageItem: ImageItem) {
        setImage(imageItem.normal, for: .normal)
        setImage(imageItem.highlight, for: .highlighted)
        setImage(imageItem.selected, for: .selected)
        setImage(imageItem.disable, for: .disabled)
    }
    
    //设置全状态图标
    func setAllIcon(_ image: UIImage?) {
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        setImage(image, for: .selected)
        setImage(image, for: .disabled)
    }
    
}


// MARK: 背景图
extension UIButton {
    
    //设置全背景图
    func setAllBGImage(imageItem: ImageItem) {

        setBackgroundImage(imageItem.normal, for: .normal)
        setBackgroundImage(imageItem.highlight, for: .highlighted)
        setBackgroundImage(imageItem.selected, for: .selected)
        setBackgroundImage(imageItem.disable, for: .disabled)
    }
    
    //设置全背景图
    func setAllBGImage(image: UIImage?) {
        
        setBackgroundImage(image, for: .normal)
        setBackgroundImage(image, for: .highlighted)
        setBackgroundImage(image, for: .selected)
        setBackgroundImage(image, for: .disabled)
    }
    
}
