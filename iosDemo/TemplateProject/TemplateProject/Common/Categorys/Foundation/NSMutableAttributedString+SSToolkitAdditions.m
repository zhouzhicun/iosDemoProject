//
//  NSMutableAttributedString+SSToolkitAdditions.m
//  
//
//  Created by xiaoniu on 16/7/20.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "NSMutableAttributedString+SSToolkitAdditions.h"
#import <CoreText/CoreText.h>


@implementation NSMutableAttributedString (SSToolkitAdditions)

- (void)ss_setTextAttribute:(SSTextAttributedItem *)attrItem
{
    //计算文字的范围
    NSRange range = [[self string] rangeOfString:attrItem.text options:NSCaseInsensitiveSearch];
    
    //设定文字的字体大小
    CTFontRef fontFef =
    CTFontCreateWithName((__bridge CFStringRef)attrItem.font.fontName, attrItem.font.pointSize, NULL);
    
    if (fontFef) {
        
        //设置文本的字体大小, 颜色
        [self addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)fontFef range:range];
        [self addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[attrItem.color CGColor] range:range];
        CFRelease(fontFef);
        
    }
}



/* 用于TTTAttributedLabel */
- (void)ss_setLinkAttributeWithLinkText:(NSString *)linkText
                                   Font:(UIFont *)font
                                  Color:(UIColor *)color
{
    //计算可点击文字的范围
    NSRange range = [[self string] rangeOfString:linkText options:NSCaseInsensitiveSearch];
    
    //设定可点击文字的的大小
    CTFontRef fontFef = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    
    if (fontFef) {
        
        //设置可点击文本的字体大小, 颜色
        [self addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)fontFef range:range];
        [self addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[color CGColor] range:range];
        CFRelease(fontFef);
        
    }
}

@end
