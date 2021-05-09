//
//  BaseResponse.swift
//  demoProject
//
//  Created by dawn_xzr on 2021/4/12.
//

import Foundation

class XNBaseResponse: XNBaseReqEntity {
    
    var originRespDic: [String: Any] = [:]
    var respData: [String: Any]?
    var reqErr: XNRequestError?
    
    
    /********************* 模板方法 **********************/

    /**
     解析response
     */
    func parseResp(respDic: [String: Any]) {
        originRespDic = respDic
    }
    
    /**
     解析Error
     */
    func parseError(err: Error) {
        
    }
}
