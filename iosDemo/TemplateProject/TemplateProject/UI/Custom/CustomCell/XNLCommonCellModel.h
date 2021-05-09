//
//  XNLCommonCellModel.h
//  
//
//  Created by xiaoniu on 16/7/25.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XNLCommonCellModel : NSObject

/* 图标链接 */
@property(nonatomic, copy)NSString *iconUrl;

/* 图标名 */
@property(nonatomic, copy)NSString *iconName;

/* 标题 */
@property(nonatomic, copy)NSString *title;

/* 值 */
@property(nonatomic, copy)NSString *value;

/* 箭头icon */
@property(nonatomic, copy)NSString *arrowIconName;


+ (instancetype)modelWithIconName:(NSString *)iconName
                            Title:(NSString *)title
                            Value:(NSString *)value;

+ (instancetype)modelWithIconName:(NSString *)iconName
                            Title:(NSString *)title
                            Value:(NSString *)value
                    ArrowIconName:(NSString *)arrowIconName;

@end


