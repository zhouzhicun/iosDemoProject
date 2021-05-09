//
//  XNSessionManagerFactory.h
//  
//
//  Created by xiaoniu on 16/6/21.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface XNSessionManagerFactory : NSObject

+ (AFHTTPSessionManager *)createSessionManager;

//配置Https证书
+ (void)configSessionManager:(AFHTTPSessionManager *)manager httpsCerPath:(NSString *)cerPath;

@end
