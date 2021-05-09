//
//  GlobalFunctions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit


// MARK: 屏幕尺寸
func XNScreenWidth() -> CGFloat {
    return UIScreen.main.bounds.width
}

func XNScreenScale() -> CGFloat {
    return XNScreenWidth() / 375.0
}

// MARK: 适配
//UI适配：按比例缩放
func XNScale(_ distance: CGFloat) -> CGFloat  {
    return distance * XNScreenScale()
}


// MARK: 国际化
func XNLocalized(_ key: String) -> String {
    return NSLocalizedString(key, tableName: nil, bundle: Bundle.main, value: "", comment: "")
}


// MARK: Image
func XNImage(_ name: String) -> UIImage? {
    return UIImage(named: name)
}

func XNImage(file: String?) -> UIImage? {
    guard let curFile = file else { return nil }
    return UIImage(contentsOfFile: curFile)
}

/**
 图片拉伸
 */
func XNStretchImage(_ name: String) -> UIImage? {
    
    guard let curImage = UIImage(named: name) else {
        return nil
    }
    
    let width = curImage.size.width
    let height = curImage.size.height
    return curImage.stretchableImage(withLeftCapWidth: Int(width / 2.0), topCapHeight: Int(height / 2.0))
}

func XNImageView(_ name: String) -> UIImageView {
    return UIImageView(image: UIImage(named: name))
}


// MARK: String
func isEmpty(str: String?) -> Bool {
    return str == nil || str!.count == 0
}
