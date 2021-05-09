//
//  XNBaseResponse.h
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "XNNetworkConstants.h"

@interface XNBaseResponse : NSObject

@property (nonatomic, strong) Class entityClass;                        //来源于请求
@property (nonatomic, assign) XNRequestActionType actionType;           //请求行为类型

//response和error
@property (nonatomic, strong, readonly) id response;
@property (nonatomic, strong, readonly) NSError *error;

- (void)saveOriginResponse:(NSDictionary *)originResp error:(NSError *)error;


#pragma mark - 父类模板方法

//解析Response数据
- (RACTuple *)parseOriginResponse:(NSDictionary *)originResp;

//转换error
- (NSError *)convertError:(NSError *)error;

@end
