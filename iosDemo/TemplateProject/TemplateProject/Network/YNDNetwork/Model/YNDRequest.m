//
//  XNRequest.m
//  
//
//  Created by xiaoniu on 2017/11/5.
//  Copyright © 2017年 xiaoniu. All rights reserved.
//

#import "YNDRequest.h"

#import "YNDApiConstants.h"

#import "YNDResponse.h"
#import "YNDRequestParameter.h"
#import "YNDSessionManagerHelper.h"


@implementation YNDRequest


#pragma mark -- Response

- (XNBaseResponse *)createRespWithActionType:(XNRequestActionType)actionType {
    
    YNDResponse *response = [[YNDResponse alloc] init];
    response.actionType = actionType;
    return response;
}


#pragma mark - 请求参数

//业务接口请求
- (NSDictionary *)getHttpReqParamDic:(NSDictionary *)originParamsDic {
    return originParamsDic;
}

//上传请求
- (NSDictionary *)getUploadReqParamDic:(NSDictionary *)originParamsDic {
    return originParamsDic;
}

//下载请求
- (NSDictionary *)getDownloadReqParamDic:(NSDictionary *)originParamsDic {
    return originParamsDic;
}


#pragma mark -- baseUrl

+ (NSString *)getBaseUrl {
    return defaultYNDBaseURL();
}

#pragma mark - SessionManager

+ (AFHTTPSessionManager *)httpSessionManger {
    AFHTTPSessionManager *manager = [YNDSessionManagerHelper defaultSessionManager];
    [YNDSessionManagerHelper addHeaderForManager:manager];
    return manager;
}

+ (AFHTTPSessionManager *)uploadSessionManger {

    AFHTTPSessionManager *manager = [YNDSessionManagerHelper uploadSessionManager];
    [YNDSessionManagerHelper addHeaderForManager:manager];
    return manager;
}

+ (AFHTTPSessionManager *)downloadSessionManger {

    AFHTTPSessionManager *manager = [YNDSessionManagerHelper downloadSessionManager];
    [YNDSessionManagerHelper addHeaderForManager:manager];
    return manager;
}




@end
