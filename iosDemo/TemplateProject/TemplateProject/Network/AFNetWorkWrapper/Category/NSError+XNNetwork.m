//
//  NSError+Network.m
//  
//
//  Created by xiaoniu on 2018/7/1.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "NSError+XNNetwork.h"
#import <AFNetworkReachabilityManager.h>
#import "NSDictionary+SSToolkitAdditions.h"


#pragma mark - Http请求错误信息
NSString *const kRequestErrorDomainKey  = @"xn_http_request_error_domain";
NSString *const kRequestErrorTypeKey    = @"type";
NSString *const kRequestErrorMessageKey = @"message";



@implementation NSError (XNNetwork)

- (NSString *)ss_message
{
    return self.userInfo[kRequestErrorMessageKey];
}

- (XNRequestErrorType)ss_errorType
{
    return (XNRequestErrorType)[self.userInfo[kRequestErrorTypeKey] integerValue];
}


//构造Error
+ (NSError *)ss_errorWithCode:(NSInteger)code
                         type:(XNRequestErrorType)errType
                      message:(NSString *)message {
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo ss_setValue:@(errType) forKey:kRequestErrorTypeKey];
    [userInfo ss_setValue:message forKey:kRequestErrorMessageKey];
    return [NSError errorWithDomain:kRequestErrorDomainKey code:code userInfo:userInfo];
}


//转换网络错误
+ (NSError *)ss_convertError:(NSError *)error {
    
    XNRequestErrorType errType = XNRequestErrorTypeNone;
    NSString *message = nil;

    if (![error.domain isEqualToString:NSURLErrorDomain]) {
        
        //服务器错误，例如http404，500等
        errType = XNRequestErrorTypeServer;
        message = kXNNetErrMsg_ServerError;
        
    } else {
        //网络错误
        errType = XNRequestErrorTypeNetwork;
        if(![[AFNetworkReachabilityManager sharedManager] isReachable]) {
            //无网络
            message = kXNNetErrMsg_networkNotAvailable;
        } else {
            
            switch (error.code) {
                case NSURLErrorTimedOut: {
                    //连接超时
                    message = kXNNetErrMsg_TimedOut;
                    break;
                }
                default: {
                    //网络连接错误(网络异常)
                    message = kXNNetErrMsg_Other;
                    break;
                }
            }
        }
    }
    
    return [self ss_errorWithCode:error.code type:errType message:message];
}




@end
