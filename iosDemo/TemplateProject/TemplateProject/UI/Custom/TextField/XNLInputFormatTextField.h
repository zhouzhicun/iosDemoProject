//
//  XNLInputFormatTextField.h
//  XNLoan
//
//  Created by Liuyu on 5/20/15.
//  Copyright (c) 2015 xiaoniu88. All rights reserved.
//

#import <UIKit/UIKit.h>



//输入框长度限制
#define kTextFieldMobileMaxLen                  11
#define kTextFieldPasswordMaxLen                20
#define kTextFieldVerifyCodeMaxLen              6
#define kTextFieldInviteCodeMaxLen              10
#define kTextFieldAmountMaxLen                  10
#define kTextFieldIntegerAmountMaxLen           6
#define kTextFieldNameMaxLen                    12


@interface XNLInputFormatTextField : UITextField



/* 银行卡号输入过滤， 并每4位，4位用空格 */
- (BOOL)filterBankCardWithRange:(NSRange)range replaceString:(NSString *)string;

/* 手机号输入过滤 并3位+4位+4位，用空格隔开 */
- (BOOL)filterMobileWithRange:(NSRange)range replaceString:(NSString *)string;

/* 身份证号输入过滤 */
- (BOOL)filterIDCardNumberWithRange:(NSRange)range replaceString:(NSString *)string;

/* 真实姓名输入过滤 */
- (BOOL)filterRealNameWithRange:(NSRange)range replaceString:(NSString *)string;

/* 纯数字输入过滤 */
- (BOOL)filterPureNumberWithRange:(NSRange)range replaceString:(NSString *)string;

/* 大于0的整数输入过滤 */
- (BOOL)filterIntegerWithRange:(NSRange)range replaceString:(NSString *)string;

/* 纯字母输入过滤 */
- (BOOL)filterPureCharWithRange:(NSRange)range replaceString:(NSString *)string;

/* 字母+数字输入过滤 */
- (BOOL)filterNumberOrCharWithRange:(NSRange)range replaceString:(NSString *)string;

/* 浮点数输入过滤 */
- (BOOL)filterFloatNumberWithRange:(NSRange)range replaceString:(NSString *)string;

/* 输入文本内容长度过滤 */
- (BOOL)filterTextWithLength:(NSUInteger)length range:(NSRange)range replaceString:(NSString *)string;


@end
