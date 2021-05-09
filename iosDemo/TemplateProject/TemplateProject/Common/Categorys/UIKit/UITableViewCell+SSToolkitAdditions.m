//
//  UITableViewCell+SSToolkitAdditions.m
//  
//
//  Created by xiaoniu on 16/6/17.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "UITableViewCell+SSToolkitAdditions.h"

@implementation UITableViewCell (SSToolkitAdditions)

+ (NSString *)ss_cellIdentifier {
    
    return NSStringFromClass([self class]);
}


- (void)ss_setSeparatorInset:(UIEdgeInsets)edgeInset {

    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:edgeInset];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:edgeInset];
    }
}

@end
