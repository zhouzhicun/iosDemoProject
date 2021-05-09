//
//  BaseModel.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseModel.h"

@implementation XNBaseModel

//解析单个Entity, json可传dic,或json字符串
+ (nullable instancetype)parseEntityWithJSON:(nullable id)json {
    return [self yy_modelWithJSON:json];
}

//解析Entity数组，json可传arr，或json字符串
+ (NSArray *)parseEntityArrayWithJSON:(nullable id)json {
    return [NSArray yy_modelArrayWithClass:self json:json];
}



//返回一个映射Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @[@"id",@"ID"]};
}

#pragma mark - NSCoder & NSCopy

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}
- (id)copyWithZone:(NSZone *)zone {
    return [self yy_modelCopy];
}
- (NSUInteger)hash {
    return [self yy_modelHash];
}
- (BOOL)isEqual:(id)object {
    return [self yy_modelIsEqual:object];
}
- (NSString *)description {
    return [self yy_modelDescription];
}

@end
