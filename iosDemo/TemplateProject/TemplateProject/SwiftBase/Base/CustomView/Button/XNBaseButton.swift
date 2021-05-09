//
//  XNBaseButton.swift
//  MaxiAp200_Platfrom
//
//  Created by zzc on 2021/1/28.
//  Copyright © 2021 autel. All rights reserved.
//

import Foundation
import UIKit


class XNBaseButton: UIButton {
    
    private var backgroundLayer: CALayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let curBGLayer = backgroundLayer else { return }
        let curBounds = self.bounds
        curBGLayer.frame = curBounds
    }
    
    func addBGLayer(_ layer: CALayer) {
        backgroundLayer = layer
        self.layer.insertSublayer(layer, at: 0)
    }
}
