//
//  XNHttpManager.m
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "XNHttpClient.h"
#import "NSError+XNNetwork.h"
#import "AFHTTPSessionManager+XNNetwork.h"


@interface XNHttpClient ()

/** 环境类型 */
@property (nonatomic, assign) XNServerEnvType envType;

@end


@implementation XNHttpClient

DEF_SINGLETON(XNHttpClient);

//配置环境类型类型
- (void)setupWithEnvType:(XNServerEnvType)envType {
    self.envType = envType;
}


#pragma mark - HTTP请求

- (void)sendRequest:(XNBaseRequest *)request
      completeBlock:(XNRequestCompleteBlock)completeBlock {
    
    [self sendRequest:request entityClass:nil completeBlock:completeBlock];
}

- (void)sendRequest:(XNBaseRequest *)request
        entityClass:(Class)entityClass
      completeBlock:(XNRequestCompleteBlock)completeBlock {
    
    //打印请求
    [request print];
    
    __block XNBaseResponse *resp = request.response;
    resp.entityClass = entityClass;
    
    AFHTTPSessionManager *manager = request.sessionManager;
    NSURLSessionDataTask *dataTask =
    [manager dataTaskWithHTTPMethod:getReqMethodDesc(request.reqMethod)
                          URLString:request.url
                         parameters:request.reqParamDic
                     uploadProgress:nil
                   downloadProgress:nil
                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                
                                [self handleSuccessWithDataTask:task responseObject:responseObject
                                                           resp:resp completeBlock:completeBlock];
                                
                            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                
                                [self handleFailedWithDataTask:task error:error
                                                          resp:resp completeBlock:completeBlock];
                            }];
    
    [dataTask resume];
}




#pragma mark - 文件上传下载

//文件上传
- (void)uploadWithRequest:(XNBaseRequest *)request
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))constructingBodyBlock
            progressBlock:(void (^)(NSProgress *progress))progressBlock
            completeBlock:(XNRequestCompleteBlock)completeBlock {
    
    
    __block XNBaseResponse *resp = request.response;
    resp.entityClass = nil;
    
    [request.sessionManager POST:request.url
                      parameters:request.reqParamDic
       constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
           
           if (constructingBodyBlock) {
               constructingBodyBlock(formData);
           }
       } progress:^(NSProgress * _Nonnull uploadProgress) {
           if (progressBlock) {
               progressBlock(uploadProgress);
           }
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
           [self handleSuccessWithDataTask:task responseObject:responseObject
                                      resp:resp completeBlock:completeBlock];
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
           [self handleFailedWithDataTask:task error:error
                                     resp:resp completeBlock:completeBlock];
       }];
    
}

/**
 * 文件下载, 返回有如下情况:
 * 1.error：请求错误
 * 2.文件filePath: 请求成功
 *
 */
- (void)downloadWithRequest:(XNBaseRequest *)request
              progressBlock:(void (^)(NSProgress *progress))progressBlock
              completeBlock:(XNDownloadCompleteBlock)completeBlock {
    
    AFHTTPSessionManager *manager = request.sessionManager;
    [[manager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.url]]
                             progress:^(NSProgress * _Nonnull downloadProgress) {
                                 //进度
                                 CGFloat progress = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
                                 NSLog(@"progress = %f\n", progress);
                                 if (progressBlock) {
                                     progressBlock(downloadProgress);
                                 }
                             } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                 
                                 //拼接文件路径
                                 NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:response.suggestedFilename];
                                 return [NSURL fileURLWithPath:filePath];
                                 
                             } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                 
                                 if (completeBlock) {
                                     completeBlock(filePath, [NSError ss_convertError:error]);
                                 }
                                 
                             }] resume];
    
}


#pragma mark -- Private

- (void)handleSuccessWithDataTask:(NSURLSessionDataTask *)task
                   responseObject:(id)responseObject
                             resp:(XNBaseResponse *)resp
                    completeBlock:(XNRequestCompleteBlock)completeBlock
{
    //请求成功, data转json字典
    if (responseObject) {
        id tempResponse =
        [NSJSONSerialization JSONObjectWithData:(NSData *)responseObject
                                        options:NSJSONReadingMutableContainers
                                          error:nil];
        [resp saveOriginResponse:tempResponse error:nil];
    }
    
    if (completeBlock) {
        completeBlock(resp);
    }
}



- (void)handleFailedWithDataTask:(NSURLSessionDataTask *)task
                           error:(NSError *)error
                            resp:(XNBaseResponse *)resp
                   completeBlock:(XNRequestCompleteBlock)completeBlock
{
    //请求失败
    [resp saveOriginResponse:nil error:error];
    if (completeBlock) {
        completeBlock(resp);
    }
}


@end
