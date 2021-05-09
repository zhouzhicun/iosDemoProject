//
//  XNBaseHttpRequest.h
//  
//
//  Created by xiaoniu on 16/6/20.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFHTTPSessionManager.h>
#import "XNNetworkConstants.h"
#import "XNBaseResponse.h"


#pragma mark - Get, Post, Put, Delete

#define XNGetRequest(reqClass, api, params) \
[(reqClass) requestWithApi:(api) method:(XNRequestMethodGet) requestParams:(params)]

#define XNPostRequest(reqClass, api, params) \
[(reqClass) requestWithApi:(api) method:(XNRequestMethodPost) requestParams:(params)]

#define XNPutRequest(reqClass, api, params) \
[(reqClass) requestWithApi:(api) method:(XNRequestMethodPut) requestParams:(params)]

#define XNDeleteRequest(reqClass, api, params) \
[(reqClass) requestWithApi:(api) method:(XNRequestMethodDelete) requestParams:(params)]


@interface XNBaseRequest : NSObject

@property (nonatomic, copy) NSString *tag;                                      //标签，用于区分一个界面请求多个不同接口
@property (nonatomic, copy, readonly) NSString *url;                            //url
@property (nonatomic, assign, readonly) XNRequestMethod reqMethod;              //请求方法
@property (nonatomic, assign, readonly) XNRequestActionType actionType;         //请求行为类型
@property (nonatomic, copy, readonly) NSDictionary *reqParamDic;                //请求参数

@property (nonatomic, strong) XNBaseResponse *response;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

//请求参数
- (void)print;

#pragma mark - 请求
+ (XNBaseRequest *)requestWithApi:(NSString *)api
                       method:(XNRequestMethod)method
                requestParams:(NSDictionary *)reqParamsDic;

+ (XNBaseRequest *)requestWithUrl:(NSString *)url
                       method:(XNRequestMethod)method
                   actionType:(XNRequestActionType)actionType
                requestParams:(NSDictionary *)reqParamsDic;



#pragma mark - 父类模板方法，子类重写


#pragma mark -- Response

- (XNBaseResponse *)createRespWithActionType:(XNRequestActionType)actionType;


#pragma mark -- RequestParamDic

//业务接口请求
- (NSDictionary *)getHttpReqParamDic:(NSDictionary *)originParamsDic;

//上传请求
- (NSDictionary *)getUploadReqParamDic:(NSDictionary *)originParamsDic;

//下载请求
- (NSDictionary *)getDownloadReqParamDic:(NSDictionary *)originParamsDic;


#pragma mark -- baseUrl

+ (NSString *)getBaseUrl;

#pragma mark -- SessionManager

//业务请求sessionManger
+ (AFHTTPSessionManager *)httpSessionManger;

//上传请求sessionManger
+ (AFHTTPSessionManager *)uploadSessionManger;

//下载请求sessionManger
+ (AFHTTPSessionManager *)downloadSessionManger;





@end




