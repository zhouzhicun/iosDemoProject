//
//  XNLCommonCellModel.m
//  
//
//  Created by xiaoniu on 16/7/25.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLCommonCellModel.h"

@implementation XNLCommonCellModel

+ (instancetype)modelWithIconName:(NSString *)iconName
                            Title:(NSString *)title
                            Value:(NSString *)value
{
    return [self modelWithIconName:iconName Title:title Value:value ArrowIconName:nil];
}

+ (instancetype)modelWithIconName:(NSString *)iconName
                            Title:(NSString *)title
                            Value:(NSString *)value
                    ArrowIconName:(NSString *)arrowIconName
{
    XNLCommonCellModel *model = [[XNLCommonCellModel alloc] init];
    model.iconName = iconName;
    model.title    = title;
    model.value    = value;
    model.arrowIconName = arrowIconName;
    
    return model;
}

@end
