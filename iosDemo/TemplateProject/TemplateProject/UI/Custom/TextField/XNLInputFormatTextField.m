//
//  XNLInputFormatTextField.m
//  XNLoan
//
//  Created by zzc on 5/20/17.
//  Copyright (c) 2015 xiaoniu88. All rights reserved.
//

#import "XNLInputFormatTextField.h"
#import "XNGlobalMacros.h"
#import <Masonry/Masonry.h>

@implementation XNLInputFormatTextField

//避免开启动画的时候约束会窜
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self layoutIfNeeded];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:)) {
        return NO;
    }
        
    return [super canPerformAction:action withSender:sender];
}



/* 银行卡号输入过滤， 并每4位，4位用空格 */
- (BOOL)filterBankCardWithRange:(NSRange)range replaceString:(NSString *)string
{
    //银行卡限制
    NSString *text = self.text;
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    UITextRange *selectionRange = nil;
    //处理删除
    if (string.length == 0) {
        
        //在空格前删除
        if (text.length) {
            NSString *deleteString = [text substringWithRange:NSMakeRange(range.location, 1)];
            if ([deleteString isEqualToString:@" "]) {
                range.location -= 1;
            }
            
            UITextPosition *beginning = self.beginningOfDocument;
            UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
            UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location];
            selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
        }
        
    } else {
        
        //在字符串中间删除
        if (range.location < text.length) {
            UITextPosition *beginning = self.beginningOfDocument;
            UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location + 1];
            UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + 1];
            selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
        }
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    if (newString.length >= 24) {
        return NO;
    }
    self.text = newString;
    
    if (selectionRange) {
        [self setSelectedTextRange:selectionRange];
    }
    
    return NO;
}


/* 手机号输入过滤 并3位+4位+4位，用空格隔开 */
- (BOOL)filterMobileWithRange:(NSRange)range replaceString:(NSString *)string
{
    //手机号限制
    NSString *text = self.text;
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    UITextRange *selectionRange = nil;
    //处理删除
    if (string.length == 0) {
        
        //在空格前删除
        if (text.length) {
            NSString *deleteString = [text substringWithRange:NSMakeRange(range.location, 1)];
            if ([deleteString isEqualToString:@" "]) {
                range.location -= 1;
            }
            
            UITextPosition *beginning = self.beginningOfDocument;
            UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
            UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location];
            selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
        }
        
    } else {
        
        //在字符串中间删除
        if (range.location < text.length) {
            UITextPosition *beginning = self.beginningOfDocument;
            UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location + 1];
            UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + 1];
            selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
        }
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    NSInteger calCount = 0;
    
    NSString *newString = @"";
    while (text.length > 0) {
        
        //特殊处理第一个间隔3个字符，其余还是4个
        NSInteger charCount = 0;
        if (calCount == 0) {
            charCount = 3;
        } else {
            charCount = 4;
        }
        
        NSString *subString = [text substringToIndex:MIN(text.length, charCount)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == charCount) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, charCount)];
        
        calCount++;
    }
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    if (newString.length >= 14) {
        return NO;
    }
    self.text = newString;
    
    if (selectionRange) {
        [self setSelectedTextRange:selectionRange];
    }
    
    return NO;
}


/* 身份证号输入过滤 */
- (BOOL)filterIDCardNumberWithRange:(NSRange)range replaceString:(NSString *)string
{
    //身份证号限制
    NSString *text = self.text;
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789xX\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    //最后18位身份证号，最后一位必须是不分大小写的x
    if ([string isEqualToString:@"X"] || [string isEqualToString:@"x"]) {
        //        if (text.length < 18 - 1 || range.location < 18 - 1) {
        //            return NO;
        //        }
        if (range.location != 18 - 1) {
            return NO;
        }
    }
    
    //防止x后可以再输入数字
    if (range.location > 0) {
        NSString *prevString = [text substringWithRange:NSMakeRange(range.location - 1, 1)];
        //        NSLog(@"prevString = %@", prevString);
        if (prevString && prevString.length) {
            if ([prevString isEqualToString:@"X"] || [prevString isEqualToString:@"x"]) {
                return NO;
            }
        }
    }
    
    //    NSUInteger count = text.length;
    //    if (range.length == 1 && count > 0) {
    //        count--;
    //    }
    //    if ((range.length == 0 && text.length > 0) || (range.length == 0 && count > 0) ) {
    //        count++;
    //    }
    //    if (count > 18) {
    //        return NO;
    //    }
    //
    //    return YES;
    
    UITextRange *selectionRange = nil;
    //处理删除
    if (string.length == 0) {
        
        UITextPosition *beginning = self.beginningOfDocument;
        UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
        UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location];
        selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
        
    } else {
        
        //在字符串中间删除
        if (range.location < text.length) {
            UITextPosition *beginning = self.beginningOfDocument;
            UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location + 1];
            UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + 1];
            selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
        }
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    if (text.length > 18) {
        return NO;
    }
    
    self.text = text;
    
    if (selectionRange) {
        [self setSelectedTextRange:selectionRange];
    }
    
    return NO;
}


/* 真实姓名输入过滤 */
- (BOOL)filterRealNameWithRange:(NSRange)range replaceString:(NSString *)string
{
    //第三方输入法，现在只有搜狗输入法。
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PasswordPredicate7];
    BOOL isMatch = [pred evaluateWithObject:string];
    if (isMatch) {
        return YES;
    }
    
    NSCharacterSet *characterSet =
    [NSCharacterSet characterSetWithCharactersInString:@"➋➌➍➎➏➐➑➒abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.·\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    return YES;
}


/* 纯数字输入过滤 */
- (BOOL)filterPureNumberWithRange:(NSRange)range replaceString:(NSString *)string
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    return YES;
}




/* 大于0的整数输入过滤 */
- (BOOL)filterIntegerWithRange:(NSRange)range replaceString:(NSString *)string
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    NSString *text = self.text;
    
    //判断输入的字符是否有效
    if ([string length] > 0) {
        
        //防止第一个字符为"0"
        if (text.length == 0  && [string hasPrefix:@"0"]) {
            return NO;
        }
        
    }
    
    return YES;
}







/* 纯字母输入过滤 */
- (BOOL)filterPureCharWithRange:(NSRange)range replaceString:(NSString *)string
{
    NSCharacterSet *characterSet =
    [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    return YES;
}


/* 字母+数字输入过滤 */
- (BOOL)filterNumberOrCharWithRange:(NSRange)range replaceString:(NSString *)string
{
    NSCharacterSet *characterSet =
    [NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    return YES;
}




/* 浮点数输入过滤 */
- (BOOL)filterFloatNumberWithRange:(NSRange)range replaceString:(NSString *)string
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789.\b"];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    
    NSString *text = self.text;
    
    //判断输入的字符是否有效
    if ([string length] > 0) {

        //防止第一个字符为小数点
        if (text.length == 0  && [string containsString:@"."]) {
            return NO;
        }
        
        //防止输入多个小数点
        if ([text containsString:@"."]  && [string containsString:@"."]) {
            return NO;
        }
        
        //过滤小数点位数(小数部分不超过2位)
        if ([text containsString:@"."]) {
            NSArray *arr = [text componentsSeparatedByString:@"."];
            if (arr.count >= 2) {
                NSString *decimalPart = arr[1];
                if (decimalPart.length + string.length > 2) {
                    return NO;
                }
            }
        }
    }
    
    return YES;
}


/* 输入文本内容长度过滤 */
- (BOOL)filterTextWithLength:(NSUInteger)length range:(NSRange)range replaceString:(NSString *)string {
    
    //删除操作, 直接返回YES， 确保能够删除字符
    if (string.length == 0) return YES; // return YES
    
    //输入操作
    NSInteger existedLength  = self.text.length;
    NSInteger selectedLength = range.length;    //输入时为0
    NSInteger replaceLength  = string.length;
    
    if (existedLength - selectedLength + replaceLength > length) {
        return NO;
    }
    
    return YES;
}






@end
