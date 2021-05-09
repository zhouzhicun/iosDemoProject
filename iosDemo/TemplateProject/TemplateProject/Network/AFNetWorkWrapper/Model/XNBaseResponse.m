//
//  XNBaseResponse.m
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "XNBaseResponse.h"

@interface XNBaseResponse ()

//response和error
@property (nonatomic, strong) id response;
@property (nonatomic, strong) NSError *error;

@end

@implementation XNBaseResponse

- (void)saveOriginResponse:(NSDictionary *)originResp error:(NSError *)error {
    if (error) {
        self.response = nil;
        self.error = [self convertError:error];
    } else {
        RACTuple *tuple = [self parseOriginResponse:originResp];
        self.response = tuple.first;
        self.error = tuple.second;
    }
}



/**
 解析Response数据
 */
- (RACTuple *)parseOriginResponse:(NSDictionary *)originResp {
    return nil;
}

/**
 转换error
 */
- (NSError *)convertError:(NSError *)error {
    return nil;
}

@end
