//
//  SSColorAttributedItem.h
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark - 颜色

#define SSColorAttrItem(normal, high, selected, disable) \
[SSColorAttributedItem itemWithNormal:(normal) High:(high) Selected:(selected) Disable:(disable)]


@interface SSColorAttributedItem : NSObject

@property (nonatomic, strong) UIColor *normalColor;       /* normal */
@property (nonatomic, strong) UIColor *highLightColor;    /* 高亮 */
@property (nonatomic, strong) UIColor *selectedColor;     /* 选中 */
@property (nonatomic, strong) UIColor *disableColor;      /* 禁用 */

+ (instancetype)itemWithNormal:(UIColor *)normal
                          High:(UIColor *)high
                      Selected:(UIColor *)selected
                       Disable:(UIColor *)disable;

@end
