//
//  BaseViewController.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
//    
//    let disposeBag = DisposeBag()
//    
//    let defaultBGColor: UIColor = .white
//    
//    var curTipView: UIView?
//
//    //ViewModel
//    @objc var viewModel: BaseViewModel?
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        commonInit()
//    }
//
//    func commonInit() {
//        //默认
//        defaultConfig()
//        
//        setupNavigation()
//        setupSubview()
//        configListView()
//        
//        setupConstraint()
//        setupEvent()
//        setupBinding()
//    }
//    
//    //VC默认设置
//    private func defaultConfig() {
//        
//         hidesBottomBarWhenPushed = true
//         view.backgroundColor = defaultBGColor
//         edgesForExtendedLayout = []
//         if #available(iOS 11.0, *) {
//             self.automaticallyAdjustsScrollViewInsets = false
//         }
//     }
//    
//    
//    //设置导航栏
//    func setupNavigation() {}
//    
//    //设置subView
//    func setupSubview() {}
//    
//    //设置约束
//    func setupConstraint() {}
//    
//    //设置事件绑定
//    func setupEvent() {}
//    
//    //rx绑定
//    func setupBinding() {
//        
//        guard let curVM = viewModel else {
//            print("注意：\(type(of: self)) 没有初始化viewModel ！！！")
//            return
//        }
//        
//        curVM.toastSubject.subscribe { [unowned self] event in
//            let message = event.element ?? ""
//            self.handleShowToast(message)
//
//        }.disposed(by: disposeBag)
//        
//        curVM.loadingSubject.subscribe {[unowned self] event in
//            let isLoad = event.element ?? false
//            self.showLoading(isLoad)
//        }.disposed(by: disposeBag)
//        
//        curVM.noNetSubject.subscribe { [unowned self] event in
//            let show = event.element ?? false
//            self.handleShowNoNetView(show)
//            
//        }.disposed(by: disposeBag)
//        
//        curVM.successSubject.subscribe { [unowned self] event in
//            let reqTag = event.element ?? 0
//            self.handleReqSuccess(reqTag)
//        }.disposed(by: disposeBag)
//        
//        
//        curVM.failedSubject.subscribe { [unowned self] event in
//            let (reqTag, code, message) = event.element ?? (0, 0, "")
//            self.handleReqFailed(reqTag, code: code, msg: message)
//        }.disposed(by: disposeBag)
//        
//        curVM.invalidTokenSubject.subscribe { [unowned self] event in
//            let message = event.element ?? ""
//            self.handleInvalidToken(message)
//        }.disposed(by: disposeBag)
//
//    }
//
//  
///*************************** 模板方法 ****************************************/
//    /**
//     配置ListView
//     */
//    func configListView() {
//        
//    }
//    
//    
//    /**
//     toast
//     */
//    func handleShowToast(_ message: String) {
//        showToast(message)
//    }
//    
//    /**
//     loading
//     */
//    func handleShowLoading(_ show: Bool) {
//        showLoading(show)
//    }
//    
//    /**
//     无网络
//     */
//    func handleShowNoNetView(_ show: Bool) {
//        if show {
//            showNoNetView(superView: self.view) { [unowned self] in
//                self.removeTipView()
//                self.reRequestData()
//            }
//        } else {
//            removeTipView()
//        }
//    }
//    
//    /**
//     无数据
//     */
//    func handleNoDataView(_ show: Bool) {
//        if show {
//            showNoDataView(superView: self.view) { [unowned self] in
//                self.removeTipView()
//                self.reRequestData()
//            }
//        } else {
//            removeTipView()
//        }
//    }
//    
//    
//    
//    /**
//     请求成功
//     */
//    func handleReqSuccess(_ tag: Int) {
//        
//    }
//    
//    /**
//     请求失败
//     */
//    func handleReqFailed(_ tag: Int, code: Int, msg: String) {
//     
//    }
//    
//    /**
//     无效token
//     */
//    func handleInvalidToken(_ message: String) {
//        //showToast(message)
//    }
//    
//    /**
//     列表请求成功
//     */
//    func handleListReqSuccess() {
//        
//    }
//    
//    /**
//     列表请求失败
//     */
//    func handleListReqFailed(code: Int, msg: String) {
//        
//    }
//
//    /**
//     重新请求
//     */
//    func reRequestData() {
//        
//    }
//
//}
//
//
//
//extension BaseViewController {
//    
//    //隐藏键盘
//    func hideKeyBoard() {
//        self.view.endEditing(true)
//    }
//    
//    //默认返回处理
//    @objc func onPressedBack() {
//        hideKeyBoard()
//        self.navigationController?.popViewController(animated: true)
//    }
//    
//    //设置导航栏左右按钮
//    func configNavigation(_ leftBottons: [UIBarButtonItem],
//                          rightBottons: [UIBarButtonItem]) {
//        self.navigationItem.leftBarButtonItems = leftBottons
//        self.navigationItem.rightBarButtonItems = rightBottons
//    }
//    
//}
//
//
////创建tableView, collectionView
//extension BaseViewController {
//    
//    //创建
//    func createTableView() -> UITableView {
//        let tableView = UITableView()
//        tableView.backgroundColor = .white
//        tableView.tableFooterView = UIView()
//        tableView.separatorStyle = .none
//        
//        //默认开启估算高度
//        tableView.estimatedRowHeight = CGFloat(44.0)
//        tableView.rowHeight = UITableView.automaticDimension
//        
//        tableView.estimatedSectionHeaderHeight = CGFloat(30.0)
//        tableView.sectionHeaderHeight = UITableView.automaticDimension
//
//        tableView.estimatedSectionFooterHeight = CGFloat(30.0)
//        tableView.sectionFooterHeight = UITableView.automaticDimension
//        
//        return tableView
//    }
//    
//    
//    //创建
//    func createCollectionView() -> UICollectionView {
//    
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        collectionView.backgroundColor = .white
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }
//    
//    //配置layout + contentInset
//    func configCollectionView(_ collectionView: UICollectionView, layout: UICollectionViewFlowLayout, contentInset: UIEdgeInsets = .zero) {
//        collectionView.collectionViewLayout = layout
//        collectionView.contentInset = contentInset
//    }
}

