//
//  XNHttpResponse.m
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "YNDResponse.h"
#import "YNDResponseParamsConstants.h"
#import "NSError+XNNetwork.h"

@implementation YNDResponse

//解析Response数据
- (RACTuple *)parseOriginResponse:(NSDictionary *)originResp {
    
    //保存原始数据
    NSDictionary *responseDic = originResp;
    self.originRespDic = responseDic;
    
    //默认初始化
    XNRequestErrorType errType = XNRequestErrorTypeNone;
    NSString *message = nil;
    NSString *code = kYNDResponseCode_Success;
    
    //无数据是否认为服务器错误，具体由业务来定
//    //1 无数据, 认为服务器错误, 并返回
//    if (responseDic.count == 0) {
//
//        errType = XNRequestErrorTypeServer;
//        message = kXNNetErrMsg_ServerError;
//        NSError *err = [NSError ss_errorWithCode:code.integerValue type:errType message:message];
//        return RACTuplePack(nil, err);
//    }
    
    //1 错误信息
    message = responseDic[kYNDRespMessageKey];
    
    //2 解析code错误码: 兼容字符串和整数
    id codeValue = responseDic[kYNDRespCodeKey];
    if ([codeValue isKindOfClass:[NSString class]]) {
        code = (NSString *)codeValue;
    } else if ([codeValue isKindOfClass:[NSNumber class]]) {
        code = [(NSNumber *)codeValue stringValue];
    }
    
    //3.错误码处理
    if (![code isEqualToString:kYNDResponseCode_Success] &&
        ![code isEqualToString:kYNDResponseCode_UploadSuccess]) {
        
        //3.1 业务错误, 并继续判断是否Token失效
        errType = XNRequestErrorTypeBusiness;
        if ([code isEqualToString:kYNDResponseCode_InvildToken]) {
            errType = XNRequestErrorTypeTokenInvalid;
        }
        NSError *err = [NSError ss_errorWithCode:code.integerValue type:errType message:message];
        return RACTuplePack(nil, err);
        
    } else {

        //3.2 业务成功
        id data = responseDic[kYNDRespDataKey];
        if (self.entityClass) {
            
            //解析data为entity对象
            SEL methodSEL = NSSelectorFromString(@"parseEntityWithJSON:");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            id obj = nil;
            if ([self.entityClass respondsToSelector:methodSEL]) {
                obj = [self.entityClass performSelector:methodSEL withObject:data];
            } else {
                obj = nil;
            }
            return RACTuplePack(obj, nil);
            
#pragma clang diagnostic pop
            
        } else {
            return RACTuplePack(data, nil);
        }
    }
    
}



- (NSError *)convertError:(NSError *)error {
    return [NSError ss_convertError:error];
}



@end
