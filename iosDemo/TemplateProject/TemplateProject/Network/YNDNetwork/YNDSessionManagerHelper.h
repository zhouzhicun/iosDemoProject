//
//  YNDSessionManagerHelper.h
//  
//
//  Created by xiaoniu on 2018/7/1.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNSessionManagerFactory.h"


@interface YNDSessionManagerHelper : NSObject

+ (void)addHeaderForManager:(AFHTTPSessionManager *)manager;

+ (AFHTTPSessionManager *)defaultSessionManager;

+ (AFHTTPSessionManager *)uploadSessionManager;

+ (AFHTTPSessionManager *)downloadSessionManager;

@end
