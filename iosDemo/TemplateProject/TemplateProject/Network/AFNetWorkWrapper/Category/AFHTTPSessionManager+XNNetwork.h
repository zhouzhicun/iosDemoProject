//
//  NSObject+YND.h
//  yndBtc
//
//  Created by xiaoniu on 2019/7/11.
//  Copyright © 2019 ynd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"


/************************************************/
//
// 通过类别暴露AFHTTPSessionManager的私有方法，便于上层直接调用该聚合方法
//
/************************************************/

NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPSessionManager (XNNetwork)

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

NS_ASSUME_NONNULL_END
