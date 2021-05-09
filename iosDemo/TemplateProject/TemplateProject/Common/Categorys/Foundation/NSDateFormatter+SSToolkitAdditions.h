//
//  NSDateFormatter+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SSToolkitAdditions)

+ (instancetype)ss_dateFormatter;
+ (instancetype)ss_dateFormatterWithFormat:(NSString *)dateFormat;
+ (instancetype)ss_defaultDateFormatter;  /*yyyy-MM-dd HH:mm:ss*/

+ (instancetype)ss_hhmmssFormatter;

@end
