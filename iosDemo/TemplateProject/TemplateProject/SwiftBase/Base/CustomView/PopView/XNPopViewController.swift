//
//  XNPopViewController.swift
//  demoProject
//
//  Created by zzc on 2021/4/25.
//

import Foundation
import UIKit
import SnapKit

/**
 弹出View
 */

@objc
enum PopPosition: Int {
    case center
    case bottom
}

class XNPopViewController: UIViewController {
    
    @objc
    var autoDismiss = false     //触摸蒙版处，是否自动消失
    
    lazy var popMaskView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.popMaskView.backgroundColor = UIColor(hex: 0x000000, transparency: 0.3)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMaskView()
    }
    
    func setupMaskView() {
        view.insertSubview(popMaskView, at: 0)
        popMaskView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    @objc
    func handleTap() {
        if autoDismiss {
            dismiss()
        }
    }
    

    // MARK: 添加bodyView
    @objc
    func addBodyView(_ bodyView: UIView, position: PopPosition) {
        view.addSubview(bodyView)
        switch position {
        case .center:
            bodyView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        case .bottom:
            bodyView.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
            }
        }
    }
    
    /**
     仅适用于swift
     */
    func addBodyView(_ bodyView: UIView, closure: (_ make: ConstraintMaker) -> Void) {
        view.addSubview(bodyView)
        bodyView.snp.makeConstraints(closure)
    }
    

    // MARK: 弹出present
    @objc
    func presentBy(_ superVC: UIViewController) {
        modalPresentationStyle = .overCurrentContext
        superVC.present(self, animated: false, completion: nil)
    }
    
    @objc
    func dismiss() {
        self.dismiss(animated: false, completion: nil)
    }
    
}

