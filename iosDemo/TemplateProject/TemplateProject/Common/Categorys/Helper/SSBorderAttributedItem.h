//
//  SSBorderAttributedItem.h
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define SSBorderAttrItem(widthVal, colorVal, radiusVal) \
[SSBorderAttributedItem itemWithWidth:(widthVal) color:(colorVal) radius:(radiusVal)]


@interface SSBorderAttributedItem : NSObject

@property (nonatomic, copy) NSNumber *width;        //边框宽度
@property (nonatomic, strong) UIColor *color;       //边框颜色
@property (nonatomic, copy) NSNumber *radius;       //圆角

+ (instancetype)itemWithWidth:(NSNumber *)width
                        color:(UIColor *)color
                       radius:(NSNumber *)radius;


@end

