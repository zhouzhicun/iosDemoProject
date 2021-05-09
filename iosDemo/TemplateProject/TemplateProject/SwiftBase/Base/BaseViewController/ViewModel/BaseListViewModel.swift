//
//  BaseListViewModel.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import RxSwift


class BaseListViewModel: BaseViewModel {
    
    var listViewType: APListViewType = .tableView
    var listViewSubType: APListViewSubType = .normal
    
    /// 数据源
    var itemArr: [Any] = []
    
    /// 分页信息
    var totalRecord: Int = 0    //总记录条数
    var curPageIndex: Int = 1   //当前页索引
    var pageSize: Int = 20      //页大小
    var tmpPageIndex: Int = 0   //临时页索引，发起请求时用
    

    //获取列表数据请求成功
    lazy var fetchListDataSuccessSubject: PublishSubject<Int> = {
        return PublishSubject()
    }()
    
    //获取列表数据请求失败
    lazy var fetchListDataFailedSubject: PublishSubject<(Int, String)> = {
        return PublishSubject()
    }()
    
    //获取列表数据请求返回空列表
    lazy var emptyListDataSubject: PublishSubject<Bool> = {
        return PublishSubject()
    }()
    
    //结束刷新
    lazy var endRefreshSubject: PublishSubject<Bool> = {
        return PublishSubject()
    }()

    //结束load
    lazy var endLoadSubject: PublishSubject<Bool> = {
        return PublishSubject()
    }()
    
    //隐藏load
    lazy var hideLoadSubject: PublishSubject<Bool> = {
        return PublishSubject()
    }()
    
}



extension BaseListViewModel {
    
    /// 获取当前请求的page信息
    func getPageInfo(isRefresh: Bool) -> (Int, Int) {
        tmpPageIndex = isRefresh ? 1 : curPageIndex + 1
        return (tmpPageIndex, pageSize)
    }
    
    /// 保存分页信息
    func savePageIndex() {
        curPageIndex = tmpPageIndex
    }
    
    //结束动画
    func endAnimation(isRefresh: Bool) {
        
        if isRefresh {
            if listViewSubType == .refresh ||
                listViewSubType == .paged {
                self.endRefreshSubject.onNext(true)
            }
        } else {
            if listViewSubType == .paged {
                self.endLoadSubject.onNext(true)
            }
        }
    }
}


// MARK: 模板方法

/********************** 模板方法 ***********************/

extension BaseListViewModel {

    /**
     解析数据
     */
    func parseListResponse(resp: XNBaseResponse, isRefresh: Bool) {
        //解析得到记录数组，并追加到itemArr即可。
    }
    
    /**
     解析业务错误, 默认发送failed信号
     一般情况下需要处理错误码，根据错误码展示不同UI。
     */
    func parseListBusinessError(reqErr: XNRequestError) {
        failedSubject.onNext((reqErr.tag, reqErr.code, reqErr.message))
    }
    
    
    //创建列表请求：子类必须重写
    func createListReq(isRefresh: Bool) -> XNBaseRequest {
        //let (pageIndex, pageSize) = getPageInfo(isRefresh: isRefresh)
        return XNBaseRequest()
    }

    func isNotEmptyData() -> Bool {
        return (itemArr.count > 0)
    }
}


// MARK: 网络请求

extension BaseListViewModel {
    
//    //请求数据
//    func fetchListData(isRefresh: Bool) {
//
//        let req = createListReq(isRefresh: isRefresh)
//        XNHttpClient.sharedInstance()?.send(req, complete: { [weak self] response in
//
//            //1.结束动画
//            guard let strongSelf = self else { return }
//            guard let curResp = response as? XNBaseResponse else {return}
//
//            strongSelf.loadingSubject.onNext(false)
//            strongSelf.endAnimation(isRefresh: isRefresh)
//
//            if curResp.reqErr != nil {
//                handleListError(reqErr: resp.reqErr!)
//            } else {
//                handleListResponseData(resp: curResp, isRefresh: isRefresh)
//            }
//        })
//    }
    
}



extension BaseListViewModel {
    
    
    func handleListResponseData(_ resp: XNBaseResponse, isRefresh: Bool) {

        //1.停止loading
        loadingSubject.onNext(false)
        
        //2.如果是刷新，先清空数据
        if isRefresh {
            itemArr.removeAll()
        }
        
        //3.解析数据
        parseListResponse(resp: resp, isRefresh: isRefresh)
        savePageIndex()

        //4.回调UI
        let curCount = itemArr.count
        if isRefresh {
            switch listViewSubType {
            case .normal, .refresh:

                if curCount == 0 {
                    emptyListDataSubject.onNext(true)
                }
                
            case .paged:
               
                if (curCount == 0) || (curCount >= self.totalRecord)  {
                    hideLoadSubject.onNext(true)
                }
                if curCount == 0 {
                    emptyListDataSubject.onNext(true)
                }
            }

        } else {
            //加载更多
            if (curCount == 0) || (curCount >= self.totalRecord)  {
                hideLoadSubject.onNext(true)
            }
            if curCount == 0 {
                emptyListDataSubject.onNext(true)
            }
        }

        //5.通知请求成功
        fetchListDataSuccessSubject.onNext(resp.tag)

    }
    
    
    
    func handleListError(reqErr: XNRequestError) {
        
        //停止loading
        loadingSubject.onNext(false)
        
        switch reqErr.type {
        case .cancel:
            //取消
            print("请求被取消：\(reqErr.url)")
        case .noNetwork:
            //无网络,请求失败
            print("无网络：\(reqErr.url)")
            noNetSubject.onNext(true)
        case .networkErr:
            toastSubject.onNext(reqErr.message)
        case .timeout:
            toastSubject.onNext(reqErr.message)
        case .server:
            toastSubject.onNext(reqErr.message)
        case .business:
            parseListBusinessError(reqErr: reqErr)
        case .invalidToken:
            invalidTokenSubject.onNext(reqErr.message)
        }
    }
}





