//
//  BaseModel.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNBaseModel : NSObject

//解析单个Entity, json可传dic,或json字符串
+ (nullable instancetype)parseEntityWithJSON:(nullable id)json;

//解析Entity数组，json可传arr，或json字符串
+ (NSArray *)parseEntityArrayWithJSON:(nullable id)json;


@end

NS_ASSUME_NONNULL_END
