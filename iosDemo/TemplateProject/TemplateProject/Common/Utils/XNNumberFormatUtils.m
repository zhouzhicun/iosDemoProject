//
//  XNFormatUtils.m
//  yndBtc
//
//  Created by xiaoniu on 2019/7/29.
//  Copyright © 2019 ynd. All rights reserved.
//

#import "XNNumberFormatUtils.h"

@implementation XNNumberFormatUtils


#pragma mark - 加减乘除

+ (NSDecimalNumber *)calcByIdNum1:(id)idNum1
                           idNum2:(id)idNum2
                           opType:(XNMathOperationType)opType
{
    if (!idNum1 || !idNum2) {
        return nil;
    }
    
    NSDecimalNumber *num1 = nil;
    NSDecimalNumber *num2 = nil;
    if ([idNum1 isKindOfClass:NSString.class]) {
        num1 = [[NSDecimalNumber alloc] initWithString:idNum1];
    } else if ([idNum1 isKindOfClass:NSNumber.class]) {
        num1 = [NSDecimalNumber decimalNumberWithDecimal:[(NSNumber *)idNum1 decimalValue]];
    } else if ([idNum1 isKindOfClass:NSDecimalNumber.class]) {
        num1 = idNum1;
    } else {
        num1 = nil;
    }
    
    if ([idNum2 isKindOfClass:NSString.class]) {
        num2 = [[NSDecimalNumber alloc] initWithString:idNum2];
    } else if ([idNum2 isKindOfClass:NSNumber.class]) {
        num2 = [NSDecimalNumber decimalNumberWithDecimal:[(NSNumber *)idNum2 decimalValue]];
    } else if ([idNum2 isKindOfClass:NSDecimalNumber.class]) {
        num2 = idNum2;
    } else {
        num2 = nil;
    }
    
    return [self calcByDecimalNum1:num1 decimalNum2:num2 opType:opType];
    
}


+ (NSDecimalNumber *)calcByNumStr1:(NSString *)numStr1
                           numStr2:(NSString *)numStr2
                            opType:(XNMathOperationType)opType
{
    
    NSDecimalNumber *dNum1 = [[NSDecimalNumber alloc] initWithString:numStr1];
    NSDecimalNumber *dNum2 = [[NSDecimalNumber alloc] initWithString:numStr2];
    
    return [self calcByDecimalNum1:dNum1 decimalNum2:dNum2 opType:opType];
    
}


+ (NSDecimalNumber *)calcByNum1:(NSNumber *)num1
                           num2:(NSNumber *)num2
                         opType:(XNMathOperationType)opType
{
    NSDecimalNumber *dNum1 = [NSDecimalNumber decimalNumberWithDecimal:num1.decimalValue];
    NSDecimalNumber *dNum2 = [NSDecimalNumber decimalNumberWithDecimal:num2.decimalValue];
    
    NSDecimalNumber *result =
    [self calcByDecimalNum1:dNum1 decimalNum2:dNum2 opType:opType];
    
    return result;
}


+ (NSDecimalNumber *)calcByDecimalNum1:(NSDecimalNumber *)decimalNum1
                           decimalNum2:(NSDecimalNumber *)decimalNum2
                                opType:(XNMathOperationType)opType
{
    
    NSDecimalNumber *result = nil;
    switch (opType) {
        case XNMathOperationType_ADD:
        {
            result = [decimalNum1 decimalNumberByAdding:decimalNum2];
            break;
        }
        case XNMathOperationType_SUB:
        {
            result = [decimalNum1 decimalNumberBySubtracting:decimalNum2];
            break;
        }
        case XNMathOperationType_MUL:
        {
            result = [decimalNum1 decimalNumberByMultiplyingBy:decimalNum2];
            break;
        }
        case XNMathOperationType_DIV:
        {
            result = [decimalNum1 decimalNumberByDividingBy:decimalNum2];
            break;
        }
    }
    
    return result;
}



#pragma mark - 格式化

+ (NSString *)roundNumber:(NSNumber *)number
                   digits:(int)digits
                roundMode:(NSRoundingMode)roundMode
{
    NSDecimalNumber *dNum = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    return [self roundDecimalNumber:dNum digits:digits roundMode:roundMode];
}


+ (NSString *)roundNumStr:(NSString *)numStr
                   digits:(int)digits
                roundMode:(NSRoundingMode)roundMode
{
    NSDecimalNumber *dNum = [[NSDecimalNumber alloc] initWithString:numStr];
    return [self roundDecimalNumber:dNum digits:digits roundMode:roundMode];
}


+ (NSString *)roundDecimalNumber:(NSDecimalNumber *)decimalNum
                   digits:(int)digits
                roundMode:(NSRoundingMode)roundMode
{
    NSDecimalNumberHandler *decimalNumberHandler =
    [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundMode scale:digits raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO  raiseOnDivideByZero:NO];
    
    NSDecimalNumber *roundDecimal =
    [decimalNum decimalNumberByRoundingAccordingToBehavior:decimalNumberHandler];

    return [NSString stringWithFormat:@"%@", roundDecimal];

}



#pragma mark - 四舍五入格式化

+ (NSString *)formatNumber:(NSNumber *)number digits:(NSNumber *)digits
{
    if (!number || ![number isKindOfClass:NSNumber.class]) {
        number = @(0);
    }
    
    NSRoundingMode defaultMode = NSRoundPlain;  //默认四舍五入
    int digitValue = 8; //默认8位小数
    if (digits) {
        digitValue = [digits intValue];
    }
    return [self roundNumber:number digits:digitValue roundMode:defaultMode];
}


+ (NSString *)formatFloatNum:(float)floatNum digits:(NSNumber *)digits
{
    return [self formatNumber:@(floatNum) digits:digits];
}



@end
