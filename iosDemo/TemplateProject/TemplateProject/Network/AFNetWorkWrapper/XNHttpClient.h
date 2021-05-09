//
//  XNHttpManager.h
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XNGlobalMacros.h"

#import "XNBaseRequest.h"
#import "XNBaseResponse.h"

/**
 * HTTP请求的完成block定义
 * 对于所有的请求完成回调：
 * 1 首先判断error，判断请求是否出错
 * 2 如果error == nil, 表示请求成功，根据responseDic中的错误码分析请求是否业务成功。
 */
typedef void (^XNRequestCompleteBlock)(XNBaseResponse *response);


//下载完成block
typedef void (^XNDownloadCompleteBlock)(NSURL *filePath, NSError *err);



@interface XNHttpClient : NSObject

/** 环境类型 */
@property (nonatomic, assign, readonly) XNServerEnvType envType;


AS_SINGLETON(XNHttpClient);

//配置环境类型类型
- (void)setupWithEnvType:(XNServerEnvType)envType;


#pragma mark - HTTP请求

- (void)sendRequest:(XNBaseRequest *)request
      completeBlock:(XNRequestCompleteBlock)completeBlock;

- (void)sendRequest:(XNBaseRequest *)request
        entityClass:(Class)entityClass
      completeBlock:(XNRequestCompleteBlock)completeBlock;


#pragma mark - 文件上传下载

//文件上传
- (void)uploadWithRequest:(XNBaseRequest *)request
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
            progressBlock:(void (^)(NSProgress *progress))progressBlock
            completeBlock:(XNRequestCompleteBlock)completeBlock;


/**
 * 文件下载, 返回有如下三种情况:
 * 1.error：请求错误
 * 2.文件filePath: 请求成功，文件data保存于respObject
 *
 */
- (void)downloadWithRequest:(XNBaseRequest *)request
              progressBlock:(void (^)(NSProgress *progress))progressBlock
              completeBlock:(XNDownloadCompleteBlock)completeBlock;

@end


