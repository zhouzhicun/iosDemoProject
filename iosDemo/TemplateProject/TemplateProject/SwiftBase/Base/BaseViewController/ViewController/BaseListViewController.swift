//
//  BaseListViewController.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import UIKit


class BaseListViewController: BaseViewController {
    
//
//    //列表容器View
//    lazy var listContainerView: UIView = {
//        let view = UIView()
//        return view
//    }()
//
//    //tableView
//    lazy var bodyTableView: UITableView = {
//        let tableView = createTableView()
//        return tableView
//    }()
//
//    //collectionView
//    lazy var bodyCollectionView: UICollectionView = {
//        let collectionView = createCollectionView()
//        return collectionView
//    }()
//
//
//
//
//
//    override func setupSubview() {
//        addBodyView()
//        setupMJRefresh()
//    }
//
//    override func setupBinding() {
//
//        super.setupBinding()
//        guard let curVM = viewModel as? BaseListViewModel else {
//            return
//        }
//
//        curVM.fetchListDataSuccessSubject.subscribe { [unowned self] event in
//            self.handleListReqSuccess()
//        }.disposed(by: disposeBag)
//
//        curVM.fetchListDataFailedSubject.subscribe { [unowned self] event in
//            let (code, msg) = event.element ?? (0, "")
//            self.handleListReqFailed(code: code, msg: msg)
//        }.disposed(by: disposeBag)
//
//        curVM.emptyListDataSubject.subscribe { [unowned self] event in
//
//            //if let curVM = viewModel as? BaseListViewModel { return }
//
//            let show = event.element ?? false
//            self.handleShowNoNetView(<#T##show: Bool##Bool#>)
//
//        }.disposed(by: disposeBag)
//
//        curVM.endRefreshSubject.subscribe { [unowned self] event in
//            self.endRefreshing()
//        }.disposed(by: disposeBag)
//
//        curVM.endLoadSubject.subscribe { [unowned self] event in
//            self.endLoadMore()
//        }.disposed(by: disposeBag)
//
//        curVM.hideLoadSubject.subscribe { [unowned self] event in
//            let hide = event.element ?? false
//            self.hideLoadMore(hide: hide)
//        }.disposed(by: disposeBag)
//
//    }
//
//
//    override func handleNoDataView(_ show: Bool) {
//
//        if show {
//            self.showNoDataView(superView: listContainerView) { [unowned self] in
//                self.removeTipView()
//                self.fetchListData(true)
//            }
//        } else {
//            self.removeTipView()
//        }
//    }
//
//    override func handleShowNoNetView(_ show: Bool) {
//
//        if let curVM = viewModel as? BaseListViewModel, !curVM.showListEmptyView { return }
//        if show {
//            self.showNoNetView(superView: self.listContainerView) { [unowned self] in
//                self.hideTipView()
//                self.reRequestData()
//            }
//        } else {
//            self.hideTipView()
//        }
//    }
//
//    override
//    func showNoNetWorkView(_ show: Bool) {
//
//
//    }
//
//    override
//    func reRequestData() {
//        self.showLoading(true)
//        self.fetchListData(true)
//    }
//
//    //默认实现
//    func handleListReqSuccess() {
//
//        guard let curVM = viewModel as? BaseListViewModel else {
//            return
//        }
//        if curVM.listViewType == .tableView {
//            bodyTableView.reloadData()
//        } else {
//            bodyCollectionView.reloadData()
//        }
//    }
//
//    //默认实现
//    func handleListReqFailed(code: Int, msg: String) {
//        showToast(msg)
//    }
    
}



////bodyView
//extension BaseListViewController {
//    
//    func getBodyView() -> UIScrollView {
//
//        guard let curVM = viewModel as? BaseListViewModel else {
//            return bodyTableView
//        }
//        
//        if curVM.listViewType == .tableView {
//            return bodyTableView
//        } else {
//            return bodyCollectionView
//        }
//    }
//    
//    func addBodyView() {
//        
//        view.addSubview(listContainerView)
//        listContainerView.snp.makeConstraints { make in
//            make.edges.equalTo(self.view)
//        }
//        
//        let bodyView = getBodyView()
//        listContainerView.addSubview(bodyView)
//        bodyView.snp.makeConstraints { make in
//            make.edges.equalTo(listContainerView)
//        }
//    }
//    
//    
//    func getItemArr() -> [Any] {
//        guard let curVM = viewModel as? BaseListViewModel else {
//            return []
//        }
//        return curVM.itemArr
//    }
//}
//
//
//
////网络请求
//extension BaseListViewController {
//    
//    func fetchListData(_ refresh: Bool) {
//        
//        //移除emptyView
//        removeTipView()()
//        guard let curVM = viewModel as? BaseListViewModel else {
//            return
//        }
//        //获取列表数据
//        curVM.fetchListData(isRefresh: refresh)
//    }
//}
//
//
////MJRefresh
//extension BaseListViewController {
//    
//    
//    func setupMJRefresh() {
//        
//        let header = MJRefreshNormalHeader.init { [unowned self] in
//            self.fetchListData(true)
//        }
//        header.stateLabel?.isHidden = true
//        header.lastUpdatedTimeLabel?.isHidden = true
//        header.arrowView?.image = nil
//        //header.activityIndicatorViewStyle = .white
//        header.isAutomaticallyChangeAlpha = true
//        
//        let footer = MJRefreshAutoNormalFooter.init { [unowned self] in
//            self.fetchListData(false)
//        }
//        
//        var listSubType: APListViewSubType = .normal
//        if let curVM = viewModel as? APBaseListViewModel {
//            listSubType = curVM.listViewSubType
//        }
//        
//        switch listSubType {
//        case .refresh:
//            getBodyView().mj_header = header
//        case .paged:
//            getBodyView().mj_header = header
//            getBodyView().mj_footer = footer
//            hideLoadMore(hide: true)
//        default: break
//        }
//    }
//    
//    func beginRefreshing() {
//        getBodyView().mj_header?.beginRefreshing()
//    }
//    
//    func endRefreshing() {
//        getBodyView().mj_header?.endRefreshing()
//    }
//    
//    func endLoadMore() {
//        getBodyView().mj_footer?.endRefreshing()
//    }
//    
//    func hideRefresh(hide: Bool) {
//        getBodyView().mj_header?.isHidden = hide
//    }
//    
//    func hideLoadMore(hide: Bool) {
//        getBodyView().mj_footer?.isHidden = hide
//    }
//}
