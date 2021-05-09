//
//  UIHelper+AttributedString.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

// MARK: 富文本
extension UIHelper {
    
    /**
     创建paragraphStyle
     */
    static func createParagraphStyle(alignment: NSTextAlignment, lineSpace: CGFloat) -> NSMutableParagraphStyle {
        
        let style = NSMutableParagraphStyle.init()
        style.alignment = alignment
        style.lineSpacing = lineSpace
        return style
        
        //        //调整行间距
        //        NSMutableParagraphStyle *paragraphStyleAA = [[NSMutableParagraphStyle alloc] init];
        //        paragraphStyleAA.alignment              = NSTextAlignmentCenter;        //对齐方式
        //        paragraphStyleAA.lineSpacing            = 9.0;                          //字体的行间距
        //        paragraphStyleAA.firstLineHeadIndent    = 0.0;                          //首行缩进
        //        paragraphStyleAA.headIndent             = 0.0;                          //整体缩进(首行除外)
        //        paragraphStyleAA.lineBreakMode          = NSLineBreakByTruncatingTail;  //结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
        //        paragraphStyleAA.headIndent             = 20;                           //整体缩进(首行除外)
        //        paragraphStyleAA.tailIndent             = 20;                           //
        //        paragraphStyleAA.minimumLineHeight      = 10;                           //最低行高
        //        paragraphStyleAA.maximumLineHeight      = 20;                           //最大行高
        //        paragraphStyleAA.paragraphSpacing       = 15;                           //段与段之间的间距
        //        paragraphStyleAA.paragraphSpacingBefore = 22.0f;                        //段首行空白空
    }
    
    
    /**
     创建attributedString
     */
    static func createAttributedString(textItems: [TextItem], style: NSMutableParagraphStyle?) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString.init()
        var len: Int = 0
        textItems.forEach { (textItem) in
            let subLen = textItem.text!.count
            len += subLen
            
            let subString = NSMutableAttributedString.init(string: textItem.text!)
            let attributes = [NSAttributedString.Key.font: textItem.font!,
                              NSAttributedString.Key.foregroundColor: textItem.color!]
            subString.addAttributes(attributes, range: NSRange.init(location: 0, length: subLen))
            resultString.append(subString)
        }
        
        if let style = style {
            let attributes = [NSAttributedString.Key.paragraphStyle: style]
            resultString.addAttributes(attributes, range: NSRange.init(location: 0, length: len))
        }
        
        return resultString
    }
}



