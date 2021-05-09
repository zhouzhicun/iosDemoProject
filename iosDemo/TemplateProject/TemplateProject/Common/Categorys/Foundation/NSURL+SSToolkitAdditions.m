//
//  NSURL+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "NSURL+SSToolkitAdditions.h"

@implementation NSURL (SSToolkitAdditions)

- (NSDictionary *)ss_queryParameters {
    
    NSMutableDictionary * parametersDictionary = [NSMutableDictionary dictionary];
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    for (NSString * queryComponent in queryComponents) {
        
        NSArray *componentArr = [queryComponent componentsSeparatedByString:@"="];
        if (componentArr && componentArr.count == 2) {
            NSString *key = componentArr[0];
            NSString *value = [componentArr[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            parametersDictionary[key] = value;
        }

    }
    return parametersDictionary;
}

- (id)ss_valueForParameter:(NSString *)parameterKey
{
    return [[self ss_queryParameters] objectForKey:parameterKey];
}



#pragma mark - 添加参数

//添加时间戳
- (NSURL *)ss_addCurrentTimestamp {
    
    NSTimeInterval second = [[NSDate date] timeIntervalSince1970];
    NSString *timestampParams = [NSString stringWithFormat:@"timestamp=%ld", (long)second];
    return [self ss_addQueryParamStr:timestampParams];
}

- (NSURL *)ss_addQueryParamDic:(NSDictionary *)queryParamDic
{
    NSMutableArray *pairs = [NSMutableArray array];
    for (NSString *key in queryParamDic.allKeys) {

        NSCharacterSet *charSet = [NSCharacterSet URLQueryAllowedCharacterSet];
        NSString *value = [queryParamDic[key] stringByAddingPercentEncodingWithAllowedCharacters:charSet];
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
    
    NSString *query = [pairs componentsJoinedByString:@"&"];
    return [self ss_addQueryParamStr:query];
}


//添加query参数,传入参数示例: "name=aaa&age=10"
- (NSURL *)ss_addQueryParamStr:(NSString *)queryParamStr {
    
    NSString *queryStr = self.query;
    NSString *resultQueryStr = nil;
    
    NSString *resultUrlStr = nil;
    NSString *absoluteUrlStr = self.absoluteString;
    NSRange hashRange = [absoluteUrlStr rangeOfString:@"#"];
    
    
    //判断原始url是否包含query部分
    if (queryStr && queryStr.length > 0) {
        
        //包含query
        resultQueryStr = [NSString stringWithFormat:@"%@&%@", queryStr, queryParamStr];
        resultUrlStr = [absoluteUrlStr stringByReplacingOccurrencesOfString:queryStr withString:resultQueryStr];
        
    } else {
        
        //未包含query
        resultQueryStr = [NSString stringWithFormat:@"?%@", queryParamStr];
        
        if (hashRange.location != NSNotFound) {
            
            //发现hash
            //先截取hash部分，再拼接query
            NSString *hashStr = [absoluteUrlStr substringFromIndex:hashRange.location];
            NSString *subUrl = [NSString stringWithFormat:@"%@%@", resultQueryStr, hashStr];
            resultUrlStr = [absoluteUrlStr stringByReplacingOccurrencesOfString:hashStr withString:subUrl];
            
        } else {
            
            //未发现hash
            resultUrlStr = [NSString stringWithFormat:@"%@%@",absoluteUrlStr, resultQueryStr];
        }
    }
    
    return [NSURL URLWithString:resultUrlStr];
    
}



@end
