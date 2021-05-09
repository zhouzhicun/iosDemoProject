//
//  NoDataView.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit
import SnapKit


/**
无数据tipView
 */
class NoDataTipView: BaseView {
    
    var clickClosure: (() -> Void)?
    
    override func setupSubview() {
        backgroundColor = .white
    }
    
}
