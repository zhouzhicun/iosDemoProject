//
//  BaseViewModel.swift
//  demoProject
//
//  Created by zzc on 2021/4/12.
//

import Foundation
import RxSwift


@objc
class BaseViewModel: NSObject {
    
    // MARK: 信号
    
    //用于弹toast: 返回msg
    lazy var toastSubject: PublishSubject<String> = {
        return PublishSubject()
    }()
    
    //用于弹loading框, 返回yes/no
    lazy var loadingSubject: PublishSubject<Bool> = {
        return PublishSubject()
    }()
        
    
    //无网络
    lazy var noNetSubject: PublishSubject<Bool> = {
        return PublishSubject()
    }()
    
    //用于请求成功回调UI: 返回tag
    lazy var successSubject: PublishSubject<Int> = {
        return PublishSubject()
    }()
    
    //用于请求失败回调UI, 返回: tag + code + msg
    lazy var failedSubject: PublishSubject<(Int, Int, String)> = {
        return PublishSubject()
    }()
    
    //用于无效token回调UI,返回：msg
    lazy var invalidTokenSubject: PublishSubject<String> = {
        return PublishSubject()
    }()

}

// MARK: 模板方法

/********************** 模板方法 ***********************/

extension BaseViewModel {

    /**
     解析数据, 默认发送success信号，
     一般情况下需要解析返回数据, 再刷新界面。
     */
    func parseNormalResponse(resp: XNBaseResponse) {
        successSubject.onNext(resp.tag)
    }
    
    /**
     解析业务错误, 默认发送failed信号
     一般情况下需要处理错误码，根据错误码展示不同UI。
     */
    func parseNormalBusinessError(reqErr: XNRequestError) {
        failedSubject.onNext((reqErr.tag, reqErr.code, reqErr.message))
    }

}


// MARK: 网络请求

extension BaseViewModel {
    

//    //发送请求
//    @discardableResult
//    func sendReq(_ req: XNBaseRequest, showLoading: Bool = true) -> URLSessionDataTask? {
//
//        if showLoading {
//            self.loadingSubject.onNext(true)
//        }
//
//        let task =
//        XNHttpClient.sharedInstance()?.send(req, complete: { [weak self] response in
//
//            guard let strongSelf = self else { return }
//            guard let curResp = response as? XNBaseResponse else {return}
//        
//            if showLoading {
//                strongSelf.loadingSubject.onNext(false)
//            }
//            
//            if curResp.reqErr != nil {
//                strongSelf..handleNormalError(reqErr: curResp.reqErr!)
//            } else {
//                strongSelf..handleNormalRespData(resp: curResp)
//            }
//        })
//
//        return task
//    }
    
}

extension BaseViewModel {

    
    func handleNormalRespData(resp: XNBaseResponse) {
        
        if let curErr = resp.reqErr {
            handleNormalError(reqErr: curErr)
        } else {
            parseNormalResponse(resp: resp)
        }
    }
    
    func handleNormalError(reqErr: XNRequestError) {
        
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
            parseNormalBusinessError(reqErr: reqErr)
        case .invalidToken:
            invalidTokenSubject.onNext(reqErr.message)
            
        }
    }
    

   
}
