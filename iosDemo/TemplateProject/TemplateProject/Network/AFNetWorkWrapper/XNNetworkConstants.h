//
//  XNNetworkConstants.h
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -- 枚举常量

//环境类型
typedef NS_ENUM(NSUInteger, XNServerEnvType) {
    
    XNServerEnvType_Custom = 0,            //自定义环境
    XNServerEnvType_Develop = 1,           //开发环境
    XNServerEnvType_Test = 2,              //测试环境
    XNServerEnvType_PreProduct = 3,        //预发布环境
    XNServerEnvType_Product = 4,           //生产环境
};


//HTTP请求方法
typedef NS_ENUM(NSInteger , XNRequestMethod) {
    XNRequestMethodGet = 0,        //Get请求
    XNRequestMethodPost,           //Post请求
    XNRequestMethodPut,            //put请求
    XNRequestMethodDelete,         //delete请求
};


//请求行为类型：正常http接口请求，上传，下载
typedef NS_ENUM(NSInteger , XNRequestActionType) {
    XNRequestActionTypeNormal = 0,       //接口请求业务数据
    XNRequestActionTypeUpload,           //上传请求
    XNRequestActionTypeDownload,         //下载请求
};



//错误类型
typedef NS_ENUM(NSUInteger, XNRequestErrorType) {
    
    XNRequestErrorTypeNone = 0,        /* 成功 */
    XNRequestErrorTypeNetwork,         /* 网络错误 */
    XNRequestErrorTypeServer,          /* 服务器错误(例如404,500等) */
    XNRequestErrorTypeBusiness,        /* 业务错误 */
    XNRequestErrorTypeTokenInvalid,    /* token失效 */
};




NSString *getReqMethodDesc(XNRequestMethod reqMethod);
