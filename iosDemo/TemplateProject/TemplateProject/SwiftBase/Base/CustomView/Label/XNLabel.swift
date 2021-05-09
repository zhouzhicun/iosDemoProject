//
//  XNLabel.swift
//  MaxiBas_Platfrom
//
//  Created by zzc on 2020/8/17.
//  Copyright © 2020 autel. All rights reserved.
//

import Foundation
import UIKit

class XNLabel: UILabel {
    
    var contentInsets: UIEdgeInsets? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        guard let insets = contentInsets else {
            return super.sizeThatFits(size)
        }
        
        let tempSize = CGSize(width: size.width - insets.horizontal, height: size.height - insets.vertical)
        let resultSize = super.sizeThatFits(tempSize)
        return CGSize(width: resultSize.width + insets.horizontal, height: resultSize.height + insets.vertical)
        
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            
            var width = self.preferredMaxLayoutWidth
            if width <= 0 {
                width = CGFloat.greatestFiniteMagnitude
            }
            return sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        }
    }
    
    
    override func drawText(in rect: CGRect) {
        
        guard let insets = contentInsets else {
            return super.drawText(in: rect)
        }
        
        var resultRect = rect.inset(by: insets)
        if numberOfLines == 1 && (lineBreakMode == .byWordWrapping || lineBreakMode == .byCharWrapping) {
            let height = resultRect.height + insets.top * 2
            resultRect.size.height = height
        }
        
        super.drawText(in: resultRect)
    }
    
    
}
