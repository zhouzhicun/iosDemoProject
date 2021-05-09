//
//  UIStoryboard+Extensions.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    /**
     从故事版实例化viewController
     */
    func instantiateViewController<T>(ofType type: T.Type = T.self) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else { fatalError() }
        return viewController
    }
}

