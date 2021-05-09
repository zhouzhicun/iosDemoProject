//
//  XNFormulaCalcUtils.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNFormulaCalcUtils.h"
@import ObjectiveC.runtime;

@implementation XNFormulaCalcUtils

#pragma mark - Public Method

+ (nullable NSNumber *)calculateWithFormula:(NSString *)formula
                           variableInObject:(id)object
                              inputVariable:(NSDictionary<NSString *, NSNumber *> *)variable
{
    if (formula.length == 0 || !object || !variable) {
        return nil;
    }
    
    NSMutableDictionary *parameters = [self fetchVariableWithObject:object];
    [parameters addEntriesFromDictionary:variable];
    return [self calculateWithFormula:formula parameters:parameters];
}



+ (nullable NSNumber *)calculateWithFormula:(NSString *)formula
                                 parameters:(NSDictionary<NSString *, NSNumber *> *)parameters
{
    if (formula.length == 0 || !parameters) {
        return nil;
    }
    
    id resultValue = nil;
    
    @try {
        NSExpression *exception = [NSExpression expressionWithFormat:formula];
        resultValue = [exception expressionValueWithObject:parameters context:nil];
    }
    @catch (NSException *exception) {
        NSLog(@"<%@> Exception: %@", self.class, exception);
    }
    
    if (resultValue && [resultValue isKindOfClass:NSNumber.class]) {
        return resultValue;
    }
    else {
        return nil;
    }
}



#pragma mark - Private Method

/**
 str转number
 */
+ (nullable NSNumber *)convertToNumberWithString:(NSString *)string
{
    if (string.length == 0) {
        return nil;
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [numberFormatter numberFromString:string];
}



/**
 通过runtime将obj对象转化为dic<str, number>
 */
+ (NSMutableDictionary<NSString *, NSNumber *> *)fetchVariableWithObject:(id)object
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (!object) {
        return parameters;
    }
    
    if ([object isKindOfClass:NSDictionary.class]) {
        [parameters addEntriesFromDictionary:object];
        return parameters;
    }
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([object class], &count);
    for (NSUInteger i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)] ?: @"";
        id _Nullable value = [object valueForKey:propertyName];
        
        // 保证能取到值
        if (value) {
            
            // 值是NSNumber类型直接赋值
            if ([value isKindOfClass:NSNumber.class]) {
                parameters[propertyName] = value;
            }
            
            // 值是NSString类型，先尝试转NSNumber，转成功再赋值
            else if ([value isKindOfClass:NSString.class]) {
                
                NSNumber *numberValue = [self convertToNumberWithString:value];
                if (numberValue) {
                    parameters[propertyName] = numberValue;
                }
            }
        }
    }
    free(properties);
    
    return parameters;
}


@end
