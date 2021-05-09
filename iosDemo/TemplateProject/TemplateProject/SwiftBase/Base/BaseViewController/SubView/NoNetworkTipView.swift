//
//  NoNetworkView.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit

/**
 无网络提示View
 */
class NoNetworkTipView: BaseView {
    
    var clickClosure: (() -> Void)?
    
    override func setupSubview() {
        backgroundColor = .white
    }
}
