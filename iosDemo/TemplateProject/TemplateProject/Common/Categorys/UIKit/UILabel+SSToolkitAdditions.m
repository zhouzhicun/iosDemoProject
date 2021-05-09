//
//  UILabel+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "UILabel+SSToolkitAdditions.h"



@implementation UILabel (SSToolkitAdditions)


#pragma mark - 设置文本

-(void)ss_setText:(NSString *)text
             Font:(UIFont *)font
        TextColor:(UIColor *)textColor
  BackgroundColor:(UIColor *)backgroundColor {
    
    self.text = text;
    
    
    if (font) {
        self.font = font;
    } else {
        self.font = [UIFont systemFontOfSize:15];
    }
    
    //文本默认黑色
    if (textColor) {
        self.textColor = textColor;
    } else {
        self.textColor = [UIColor blackColor];
    }
    
    //背景色默认为clearColor
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}

//设置Text
-(void)ss_setText:(SSTextAttributedItem *)textAttrItem {
    
    if (textAttrItem.text) {
        self.text = textAttrItem.text;
    }
    
    if (textAttrItem.font) {
        self.font = textAttrItem.font;
    }
    
    if (textAttrItem.color) {
        self.textColor = textAttrItem.color;
    }
}




//设置attributedText
- (void)ss_setAttrText:(NSArray<SSTextAttributedItem *> *)itemArr
        paragraphStyle:(NSParagraphStyle *)paragraphStyle
{
    
    NSMutableAttributedString *resultAttrString =
    [self.class ss_AttrStringFromAttrItems:itemArr paragraphStyle:paragraphStyle];
    
    self.attributedText = resultAttrString;
}



+ (NSMutableAttributedString *)ss_AttrStringFromAttrItems:(NSArray<SSTextAttributedItem *> *)itemArr
                                           paragraphStyle:(NSParagraphStyle *)paragraphStyle
{
    
    NSMutableAttributedString *resultAttrString = [[NSMutableAttributedString alloc] init];
    
    NSInteger length = 0;
    for (SSTextAttributedItem *item in itemArr) {
        
        length += item.text.length;
        NSMutableAttributedString *temp = [[NSMutableAttributedString alloc] initWithString:item.text];
        [temp addAttributes:@{
                              NSFontAttributeName : item.font,
                              NSForegroundColorAttributeName : item.color
                              }
                      range:NSMakeRange(0, item.text.length)];
        
        [resultAttrString appendAttributedString:temp];
    }
    
    if (paragraphStyle) {
        NSDictionary *attrDic = @{NSParagraphStyleAttributeName:paragraphStyle};
        [resultAttrString addAttributes:attrDic range:NSMakeRange(0, length)];
    }
    
    return resultAttrString;
}




//获取paragraphStyle
+ (NSMutableParagraphStyle *)ss_paragraphStyleWithAlignment:(NSTextAlignment)aligment lineSpace:(NSNumber *)lineSpace {
    
    //        //调整行间距
    //        NSMutableParagraphStyle *paragraphStyleAA = [[NSMutableParagraphStyle alloc] init];
    //        paragraphStyleAA.alignment              = NSTextAlignmentCenter;        //对齐方式
    //        paragraphStyleAA.lineSpacing            = 9.0;                          //字体的行间距
    //        paragraphStyleAA.firstLineHeadIndent    = 0.0;                          //首行缩进
    //        paragraphStyleAA.headIndent             = 0.0;                          //整体缩进(首行除外)
    //        paragraphStyleAA.lineBreakMode          = NSLineBreakByTruncatingTail;  //结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
    //        paragraphStyleAA.headIndent             = 20;                           //整体缩进(首行除外)
    //        paragraphStyleAA.tailIndent             = 20;                           //
    //        paragraphStyleAA.minimumLineHeight      = 10;                           //最低行高
    //        paragraphStyleAA.maximumLineHeight      = 20;                           //最大行高
    //        paragraphStyleAA.paragraphSpacing       = 15;                           //段与段之间的间距
    //        paragraphStyleAA.paragraphSpacingBefore = 22.0f;                        //段首行空白空
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    //对齐方式
    paragraphStyle.alignment = aligment;
    
    //字体的行间距
    if (lineSpace) {
        paragraphStyle.lineSpacing = lineSpace.floatValue;
    }
    
    return paragraphStyle;
}



#pragma mark - 计算size

//计算size
- (CGSize)ss_suggestedSizeForWidth:(CGFloat)width {
    
    CGSize size = CGSizeZero;
    if (self.attributedText) {
        size = [UILabel ss_suggestSizeForAttributedString:self.attributedText width:width];
    } else {
        size = [UILabel ss_suggestSizeForString:self.text Font:self.font width:width];
    }
    return size;
}

//根据文本计算所需size
- (CGSize)ss_suggestSizeForString:(NSString *)string width:(CGFloat)width
{
    CGSize size = CGSizeZero;
    if (string) {
        size = [UILabel ss_suggestSizeForString:string Font:self.font width:width];
        size.height += 2;
    }
    return size;
}

//根据textItem计算所需size
+ (CGSize)ss_suggestedSizeForAttrItem:(SSTextAttributedItem *)attrItem Width:(CGFloat)width
{
    return [self ss_suggestSizeForString:attrItem.text Font:attrItem.font width:width];
}



//根据文本计算所需size
+ (CGSize)ss_suggestSizeForString:(NSString *)string Font:(UIFont *)font width:(CGFloat)width
{
    CGSize size = CGSizeZero;
    if (string) {
        size = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                 attributes:@{NSFontAttributeName:font}
                                    context:nil].size;
    }
    return size;
}


//根据属性文本计算所需size
+ (CGSize)ss_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    
    CGSize size = CGSizeZero;
    if (string) {
        size = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                    context:nil].size;
    }
    
    return size;
    
}




@end
