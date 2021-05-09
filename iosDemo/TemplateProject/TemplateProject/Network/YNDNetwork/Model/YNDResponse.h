//
//  XNHttpResponse.h
//  
//
//  Created by xiaoniu on 2018/6/28.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "XNBaseResponse.h"

@interface YNDResponse : XNBaseResponse

@property (nonatomic, copy) NSDictionary *originRespDic; //保留原始数据，应对不同服务不规范的接口返回。

@end
