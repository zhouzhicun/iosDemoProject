//
//  YNDSessionManagerHelper.m
//  
//
//  Created by xiaoniu on 2018/7/1.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "YNDSessionManagerHelper.h"
#import "YNDRequestParameter.h"


@implementation YNDSessionManagerHelper

+ (AFHTTPSessionManager *)defaultSessionManager {
    
    static dispatch_once_t once;
    static AFHTTPSessionManager *manager;
    dispatch_once( &once, ^{
        
        manager = [XNSessionManagerFactory createSessionManager];
        [XNSessionManagerFactory configSessionManager:manager httpsCerPath:[self getHttpsCerPath]];
        
        // 配置requestSerializer
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [manager.requestSerializer setValue:@"UTF-8"
                         forHTTPHeaderField:kYNDHttpHeaderKey_Charset];
        
        [manager.requestSerializer setValue:@"application/json"
                         forHTTPHeaderField:kYNDHttpHeaderKey_ContentType];
        
        [manager.requestSerializer setValue:@"gzip"
                         forHTTPHeaderField:kYNDHttpHeaderKey_AcceptEncoding];

    });
    
    return manager;
}

+ (AFHTTPSessionManager *)uploadSessionManager {
    
    static dispatch_once_t uploadOnce;
    static AFHTTPSessionManager *uploadManager;
    dispatch_once( &uploadOnce, ^{
        
        uploadManager = [XNSessionManagerFactory createSessionManager];
        [XNSessionManagerFactory configSessionManager:uploadManager httpsCerPath:[self getHttpsCerPath]];
        
        
        // 配置requestSerializer
        uploadManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [uploadManager.requestSerializer setValue:@"UTF-8"
                               forHTTPHeaderField:kYNDHttpHeaderKey_Charset];
        
        [uploadManager.requestSerializer setValue:@"multipart/form-data"
                               forHTTPHeaderField:kYNDHttpHeaderKey_ContentType];
        
//        [uploadManager.requestSerializer setValue:@"gzip"
//                         forHTTPHeaderField:kYNDHttpHeaderKey_AcceptEncoding];
        
        uploadManager.requestSerializer.timeoutInterval = 60.0f;
        
    });
    
    return uploadManager;
}

+ (AFHTTPSessionManager *)downloadSessionManager {
    
    static dispatch_once_t downloadOnce;
    static AFHTTPSessionManager *downloandManager;
    dispatch_once( &downloadOnce, ^{
        
        downloandManager = [XNSessionManagerFactory createSessionManager];
        [XNSessionManagerFactory configSessionManager:downloandManager httpsCerPath:[self getHttpsCerPath]];
        
//        [downloandManager.requestSerializer setValue:@"gzip"
//                               forHTTPHeaderField:kYNDHttpHeaderKey_AcceptEncoding];
        
        downloandManager.requestSerializer.timeoutInterval = 60.0f;
        
    });
    
    return downloandManager;
}


#pragma mark - Private


+ (NSString *)getHttpsCerPath
{
    return nil;
}

+ (void)addHeaderForManager:(AFHTTPSessionManager *)manager
{
    //添加header参数
    NSDictionary *headerDic = [YNDRequestParameter headerParameters];
    for (NSString *key in headerDic) {
        [manager.requestSerializer setValue:headerDic[key] forHTTPHeaderField:key];
    }
    //超时值
    manager.requestSerializer.timeoutInterval = 20.0f;
}


@end
