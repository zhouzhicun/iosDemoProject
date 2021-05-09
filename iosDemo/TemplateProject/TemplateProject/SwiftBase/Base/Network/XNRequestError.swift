//
//  XNRequestError.swift
//  demoProject
//
//  Created by dawn_xzr on 2021/4/12.
//

import Foundation

class XNRequestError: XNBaseReqEntity {

    var type: XNRequestErrorType = .business
    var code: Int = 0
    var message: String = ""
}
