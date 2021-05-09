//
//  UILabel+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

extension UILabel
{
    func setTextItem(_ textItem: TextItem) {
        self.text = textItem.text
        self.font = textItem.font
        self.textColor = textItem.color
    }
    
    //设置富文本
    func setAttributedText(_ textItems: [TextItem], style: NSMutableParagraphStyle?) {
        self.attributedText = UIHelper.createAttributedString(textItems: textItems, style: style)
    }
}

