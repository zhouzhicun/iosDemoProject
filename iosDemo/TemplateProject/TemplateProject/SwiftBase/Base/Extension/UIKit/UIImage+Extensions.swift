//
//  UIImage+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import UIKit
import Foundation

extension UIImage {
    
    // 重设图片大小
    func reSizeImage(_ reSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return reSizeImage
    }
    
    
    // 等比率缩放
    func scaleImage(scaleSize:CGFloat) -> UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize)
    }
    
    
    func scaleImage(_ maxWidth: CGFloat) -> UIImage {
        if self.size.width <= maxWidth {
            return self
        }
        
        let height = self.size.height / self.size.width * maxWidth
        UIGraphicsBeginImageContext(CGSize(width: maxWidth, height: height))
        self.draw(in: CGRect(x: 0, y: 0, width: maxWidth, height: height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return scaledImage
        
    }

}

