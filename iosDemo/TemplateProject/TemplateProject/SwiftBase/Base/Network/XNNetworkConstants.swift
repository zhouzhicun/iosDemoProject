//
//  NetworkConstants.swift
//  demoProject
//
//  Created by dawn_xzr on 2021/4/12.
//

import Foundation

/**
 请求方法
 */
enum XNRequestMethod {
    case get
    case head
    case post
    case put
    case delete
}

/**
 请求类型
 */
enum XNRequestAction {
    case normal     //普通请求
    case upload     //上传
    case download   //下载
}


enum XNRequestErrorType {
    case cancel         //请求取消
    case noNetwork      //无网络
    case networkErr     //网络错误，请求未到服务器
    case timeout        //请求超时
    case server         //服务器错误：5xx
    case business       //业务错误
    case invalidToken   //无效token
}
