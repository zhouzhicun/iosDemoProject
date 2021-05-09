//
//  XNFormulaCalcUtils.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

/************************************************/
//
// 后台下发公式字符串，传入相关参数进行计算
//
/************************************************/

NS_ASSUME_NONNULL_BEGIN

@interface XNFormulaCalcUtils : NSObject

/**
 使用公式结算方法
 
 @param formula     公式
 @param object      公式带入的对象（对象获取公式中需要的参数）
 @param variable    公式带入的参数（可变参数。eg：UI上输入的值）
 @return            公式计算结果值
 */
+ (nullable NSNumber *)calculateWithFormula:(NSString *)formula
                           variableInObject:(id)object
                              inputVariable:(NSDictionary<NSString *, NSNumber *> *)variable;


+ (nullable NSNumber *)calculateWithFormula:(NSString *)formula
                                 parameters:(NSDictionary<NSString *, NSNumber *> *)parameters;


@end

NS_ASSUME_NONNULL_END
