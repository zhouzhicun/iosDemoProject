//
//  NSError+Network.h
//  
//
//  Created by xiaoniu on 2018/7/1.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XNNetworkConstants.h"
#import "XNNetworkErrorMsgConstants.h"



@interface NSError (XNNetwork)

- (NSString *)ss_message;

- (XNRequestErrorType)ss_errorType;

//构造Error
+ (NSError *)ss_errorWithCode:(NSInteger)code
                         type:(XNRequestErrorType)errType
                      message:(NSString *)message;

//转换网络错误
+ (NSError *)ss_convertError:(NSError *)error;

@end
