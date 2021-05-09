//
//  BaseRequest.swift
//  demoProject
//
//  Created by dawn_xzr on 2021/4/12.
//

import Foundation

class XNBaseRequest: XNBaseReqEntity {

    var method: XNRequestMethod = .get
    var action: XNRequestAction = .normal
    
    var headerParams: [String: Any]?
    var reqParams: [String: Any]?
    var bodyParams: [String: Any]?
    
    
    /********************* 模板方法 **********************/
    
    /**
     返回baseUrl
     */
    func baseUrl() -> String {
        return ""
    }
    
    /**
     创建response
     */
    func createResponse() -> XNBaseResponse {
        return XNBaseResponse()
    }
}
