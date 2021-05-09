//
//  NSDateFormatter+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "NSDateFormatter+SSToolkitAdditions.h"

@implementation NSDateFormatter (SSToolkitAdditions)

+ (instancetype)ss_dateFormatter {
    
    return [[self alloc] init];
}

+ (instancetype)ss_dateFormatterWithFormat:(NSString *)dateFormat {
    
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (instancetype)ss_defaultDateFormatter {
    
    return [self ss_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (instancetype)ss_hhmmssFormatter
{
    return [self ss_dateFormatterWithFormat:@"HH:mm:ss"];
}

@end
