//
//  XNBaseHttpRequest.m
//  
//
//  Created by xiaoniu on 16/6/20.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNBaseRequest.h"
#import "XNGlobalMacros.h"



@interface XNBaseRequest ()

@property (nonatomic, copy) NSString *url;                            //url
@property (nonatomic, assign) XNRequestMethod reqMethod;             //请求方法
@property (nonatomic, assign) XNRequestActionType actionType;        //请求行为类型
@property (nonatomic, copy) NSDictionary *reqParamDic;                //请求参数

@end


@implementation XNBaseRequest

#pragma mark - init
- (instancetype)initWithMethod:(XNRequestMethod)reqMethod
                    actionType:(XNRequestActionType)actionType
                           url:(NSString *)url
                   reqParamDic:(NSDictionary *)originReqParamsDic {
    
    self = [super init];
    if (self != nil) {
        
        self.reqMethod  = reqMethod;
        self.actionType = actionType;
        self.url        = url;
        
        self.reqParamDic =
        [self reqParamDicWithActionType:actionType originReqParamDic:originReqParamsDic];
        
        //最后设置
        self.response = [self createRespWithActionType:actionType];
    }
    return self;
}


//请求参数
- (void)print {
    
    XNLog(@"\nbegin request:\n");
    XNLog(@"url = %@\n", self.url);
    XNLog(@"method = %@\n", getReqMethodDesc(self.reqMethod));
    if (self.reqParamDic) {
        XNLog(@"params = \n%@\n", self.reqParamDic);
    }
}


#pragma mark - 请求

+ (XNBaseRequest *)requestWithApi:(NSString *)api
                           method:(XNRequestMethod)method
                    requestParams:(NSDictionary *)reqParamsDic {
    
    NSString *url = [self getUrlWithApi:api];
    XNBaseRequest *req = [self requestWithUrl:url
                                       method:method
                                   actionType:XNRequestActionTypeNormal
                                requestParams:reqParamsDic];
    
    req.tag = api;
    return req;
}

+ (XNBaseRequest *)requestWithUrl:(NSString *)url
                           method:(XNRequestMethod)method
                       actionType:(XNRequestActionType)actionType
                    requestParams:(NSDictionary *)reqParamsDic {
    
    XNBaseRequest *request =
    [[self alloc] initWithMethod:method
                               actionType:actionType
                                      url:url
                              reqParamDic:reqParamsDic];
    
    
    //设置sessionManager
    switch (actionType) {
        case XNRequestActionTypeNormal:{
            request.sessionManager = [self httpSessionManger];
            break;
        }
        case XNRequestActionTypeDownload:{
            request.sessionManager = [self downloadSessionManger];
            break;
        }
        case XNRequestActionTypeUpload:{
            request.sessionManager = [self uploadSessionManger];
            break;
        }
    }
    
    return request;
}



#pragma mark - 基类方法模板


#pragma mark -- Response

- (XNBaseResponse *)createRespWithActionType:(XNRequestActionType)actionType {
    return nil;
}

#pragma mark -- RequestParamDic

//业务接口请求
- (NSDictionary *)getHttpReqParamDic:(NSDictionary *)originParamsDic {
    return nil;
}

//上传请求
- (NSDictionary *)getUploadReqParamDic:(NSDictionary *)originParamsDic {
    return nil;
}

//下载请求
- (NSDictionary *)getDownloadReqParamDic:(NSDictionary *)originParamsDic {
    return nil;
}



#pragma mark -- baseUrl

+ (NSString *)getBaseUrl {
    return nil;
}

#pragma mark -- SessionManager

//业务请求sessionManger
+ (AFHTTPSessionManager *)httpSessionManger {
    return nil;
}

//上传请求sessionManger
+ (AFHTTPSessionManager *)uploadSessionManger {
    return nil;
}

//下载请求sessionManger
+ (AFHTTPSessionManager *)downloadSessionManger {
    return nil;
}



#pragma mark - Private

- (NSDictionary *)reqParamDicWithActionType:(XNRequestActionType)actionType
                          originReqParamDic:(NSDictionary *)originReqParamDic {
    
    switch (actionType) {
        case XNRequestActionTypeNormal: {
            
            return [self getHttpReqParamDic:originReqParamDic];
            break;
        }
        case XNRequestActionTypeUpload: {
            
            return [self getUploadReqParamDic:originReqParamDic];
            break;
        }
        case XNRequestActionTypeDownload: {
            
            return [self getDownloadReqParamDic:originReqParamDic];
            break;
        }
    }
}


+ (NSString *)getUrlWithApi:(NSString *)api {
    return [[self getBaseUrl] stringByAppendingString:api];
}

@end
