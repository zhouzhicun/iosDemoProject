//
//  NSURL+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SSToolkitAdditions)



- (NSMutableDictionary *)ss_queryParameters;

- (id)ss_valueForParameter:(NSString *)parameterKey;




- (NSURL *)ss_addCurrentTimestamp;

- (NSURL *)ss_addQueryParamDic:(NSDictionary *)queryParamDic;

//添加query参数,传入参数示例: "name=aaa&age=10"
- (NSURL *)ss_addQueryParamStr:(NSString *)queryParamStr;


@end
