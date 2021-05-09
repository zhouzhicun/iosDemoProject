//
//  UITextField+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/11/3.
//  Copyright © 2015年 fdd. All rights reserved.
//

#import "UITextField+SSToolkitAdditions.h"

@implementation UITextField (SSToolkitAdditions)





- (void)ss_setFont:(UIFont *)font Color:(UIColor *)color {

    self.font              = font;
    self.textColor         = color;

    
//    // Default property
//    self.returnKeyType                  = UIReturnKeyNext;
//    self.enablesReturnKeyAutomatically  = YES;
//    self.contentVerticalAlignment       = UIControlContentVerticalAlignmentCenter;
//    self.clearButtonMode                = UITextFieldViewModeWhileEditing;
//    self.borderStyle                    = UITextBorderStyleNone;
//    self.autocapitalizationType         = UITextAutocapitalizationTypeNone;
//    self.autocorrectionType             = UITextAutocorrectionTypeNo;
    
}


- (void)ss_setPlaceHolder:(NSString *)placeHolder font:(UIFont *)font color:(UIColor *)color {
    
    
    NSMutableParagraphStyle *style = [self.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.font.lineHeight - (self.font.lineHeight - font.lineHeight) / 2.0;
    
    NSMutableAttributedString *attrString =
    [[NSMutableAttributedString alloc] initWithString:placeHolder];

    NSDictionary *attrDic = @{NSFontAttributeName:font,
                              NSForegroundColorAttributeName:color,
                              NSParagraphStyleAttributeName:style};
    [attrString addAttributes:attrDic range:NSMakeRange(0, placeHolder.length)];
    
    self.attributedPlaceholder = attrString;
    
    //self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
}


- (void)ss_setTextAttrItem:(SSTextAttributedItem *)textAttrItem
             PlaceAttrItem:(SSTextAttributedItem *)placeAttrItem
{
    if (textAttrItem) {
        [self ss_setFont:textAttrItem.font Color:textAttrItem.color];
    }
    
    if (placeAttrItem) {
        [self ss_setPlaceHolder:placeAttrItem.text font:placeAttrItem.font color:placeAttrItem.color];
    }
}


- (void)ss_setKeyboardType:(UIKeyboardType)keyboardType Secure:(BOOL)secure Delegate:(id)delegate {

    self.keyboardType      = keyboardType;
    self.secureTextEntry   = secure;
    self.delegate          = delegate;
}



- (void)ss_selectAllText {
    
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)ss_setSelectedRange:(NSRange)range {
    
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}


@end
