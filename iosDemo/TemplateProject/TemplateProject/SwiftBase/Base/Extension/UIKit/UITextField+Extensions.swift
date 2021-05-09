//
//  UITextField+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

extension UITextField
{
    //设置text
    func setTextItem(_ textItem: TextItem) {
        self.text = textItem.text
        self.font = textItem.font
        self.textColor = textItem.color
    }
    
    //设置placeHolder
    func setPlaceHolder(_ textItem: TextItem) {
        
        if let text = textItem.text {
            if let font = textItem.font, let color = textItem.color {
                
                let style = self.defaultTextAttributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle
                let resultStyle = style?.mutableCopy() as! NSMutableParagraphStyle
                resultStyle.minimumLineHeight = self.font!.lineHeight - (self.font!.lineHeight - font.lineHeight) / 2.0
                let attrString = NSMutableAttributedString.init(string: text)
                let attributes = [NSAttributedString.Key.font: font,
                                  NSAttributedString.Key.foregroundColor: color,
                                  NSAttributedString.Key.paragraphStyle: resultStyle]
                attrString.addAttributes(attributes, range: NSRange(location: 0, length: text.count))
                attributedPlaceholder = attrString
                
            } else {
                placeholder = text
            }
        }
    }
}

