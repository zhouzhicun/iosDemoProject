//
//  SSTextAttributedItem.h
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark - 文本

#define SSTextAttrItem(text, font, color) \
[SSTextAttributedItem itemWithText:(text) Font:(font) Color:(color) Url:nil]

#define SSTextAttrItemWithUrl(text, font, color, url) \
[SSTextAttributedItem itemWithText:(text) Font:(font) Color:(color) Url:url]

@interface SSTextAttributedItem : NSObject

/* 颜色 */
@property (nonatomic, strong) UIColor *color;

/* 字体 */
@property (nonatomic, strong) UIFont *font;

/* 文本 */
@property (nonatomic, copy) NSString *text;

/* url:用于富文本url跳转 */
@property (nonatomic, copy) NSString *url;

+ (instancetype)itemWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color Url:(NSString *)url;

@end
