//
//  UILabel+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSAttributedItemCollection.h"

@interface UILabel (SSToolkitAdditions)

#pragma mark - 设置文本

-(void)ss_setText:(NSString *)text
             Font:(UIFont *)font
        TextColor:(UIColor *)textColor
  BackgroundColor:(UIColor *)backgroundColor;

//设置Text
-(void)ss_setText:(SSTextAttributedItem *)textAttrItem;


//设置attributedText
- (void)ss_setAttrText:(NSArray<SSTextAttributedItem *> *)itemArr
        paragraphStyle:(NSParagraphStyle *)paragraphStyle;


+ (NSMutableAttributedString *)ss_AttrStringFromAttrItems:(NSArray<SSTextAttributedItem *> *)itemArr
                                           paragraphStyle:(NSParagraphStyle *)paragraphStyle;

//获取paragraphStyle
+ (NSMutableParagraphStyle *)ss_paragraphStyleWithAlignment:(NSTextAlignment)aligment
                                                  lineSpace:(NSNumber *)lineSpace;





#pragma mark - 计算size

//计算size
- (CGSize)ss_suggestedSizeForWidth:(CGFloat)width;

//根据文本计算所需size
- (CGSize)ss_suggestSizeForString:(NSString *)string width:(CGFloat)width;

//根据textItem计算所需size
+ (CGSize)ss_suggestedSizeForAttrItem:(SSTextAttributedItem *)attrItem Width:(CGFloat)width;

//根据文本计算所需size
+ (CGSize)ss_suggestSizeForString:(NSString *)string Font:(UIFont *)font width:(CGFloat)width;

//根据属性文本计算所需size
+ (CGSize)ss_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;

@end
