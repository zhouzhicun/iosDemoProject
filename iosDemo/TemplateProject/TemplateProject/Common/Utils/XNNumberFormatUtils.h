//
//  XNFormatUtils.h
//  yndBtc
//
//  Created by xiaoniu on 2019/7/29.
//  Copyright © 2019 ynd. All rights reserved.
//

#import <Foundation/Foundation.h>


/************************************************/
//
// NSDecimalNumber操作：
// 1.加减乘除算术运算
// 2.四舍五入格式化
// 使用NSDecimalNumber可避免精度问题
//
/************************************************/


typedef NS_ENUM(NSUInteger, XNMathOperationType) {
    XNMathOperationType_ADD,    //加
    XNMathOperationType_SUB,    //减
    XNMathOperationType_MUL,    //乘
    XNMathOperationType_DIV,    //除
};


@interface XNNumberFormatUtils : NSObject

#pragma mark - 加减乘除

+ (NSDecimalNumber *)calcByIdNum1:(id)idNum1
                           idNum2:(id)idNum2
                           opType:(XNMathOperationType)opType;


+ (NSDecimalNumber *)calcByNumStr1:(NSString *)numStr1
                           numStr2:(NSString *)numStr2
                            opType:(XNMathOperationType)opType;


+ (NSDecimalNumber *)calcByNum1:(NSNumber *)num1
                           num2:(NSNumber *)num2
                         opType:(XNMathOperationType)opType;

+ (NSDecimalNumber *)calcByDecimalNum1:(NSDecimalNumber *)decimalNum1
                           decimalNum2:(NSDecimalNumber *)decimalNum2
                                opType:(XNMathOperationType)opType;


#pragma mark - 格式化

+ (NSString *)roundNumber:(NSNumber *)number
                   digits:(int)digits
                roundMode:(NSRoundingMode)roundMode;

+ (NSString *)roundNumStr:(NSString *)numStr
                   digits:(int)digits
                roundMode:(NSRoundingMode)roundMode;


+ (NSString *)roundDecimalNumber:(NSDecimalNumber *)decimalNum
                          digits:(int)digits
                       roundMode:(NSRoundingMode)roundMode;



#pragma mark - 四舍五入格式化

+ (NSString *)formatNumber:(NSNumber *)number digits:(NSNumber *)digits;

+ (NSString *)formatFloatNum:(float)floatNum digits:(NSNumber *)digits;




@end

