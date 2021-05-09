//
//  NSString+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableString (SSToolkitAdditions)

- (void)ss_appendNSDataBytes:(const unsigned char *)bytes Len:(NSUInteger)len;

@end


@interface NSString (SSToolkitAdditions)


- (NSData *)ss_dataFromHexStr;

- (NSData *)ss_data;

- (NSUInteger)ss_hexValue;                              //16进制字符串转换为整数

- (NSUInteger)ss_numberOfLines;                         //行数

- (NSString *)ss_trim;                                  //剔除前后空白符和换行符

- (NSString *)ss_tailN:(NSInteger)count;                //字符串尾部n个字符

- (NSString *)ss_trimAllSpace;                          //剔除前后空白符和换行符 以及字符串中的空格

- (NSString *)ss_separatedByString:(NSString *)separatedStr; //分割字符串，提取第一个字符串


//剔除左边或者右边的指定字符
- (NSString *)ss_trimmingLeftCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)ss_trimmingRightCharactersInSet:(NSCharacterSet *)characterSet;


- (BOOL)ss_containsString:(NSString *)string;           //是否包含子字符串


#pragma mark - HTML转义

- (NSString *)ss_escapeHTML;
- (NSString *)ss_unescapeHTML;


#pragma mark - URL的UTF8编码解码
-(NSString *)ss_urlUTF8Encode;
-(NSString *)ss_urlUTF8Decode;


-(NSString *)ss_AFPercentEscapedString;

#pragma mark - 字符串校验


//正则表达式判断
- (BOOL)ss_regexPredicateWithPattern:(NSString *)pattern;


//判断是否为有效URL
-(BOOL)ss_isURL;

//判断是否未中文字符串
- (BOOL)ss_isChinese;


//密码校验
- (BOOL)ss_validPassword;


//判断是否为有效的email地址
- (BOOL)ss_validEmailAddr;

//判断是否未有效的手机号码
- (BOOL)ss_validMobileNum;

//校验用户固话号码
- (BOOL)ss_validPhoneNum;

//判断是否为有效的车牌号
- (BOOL)ss_validCarNo;

//判断是否为有效的身份证号码
- (BOOL)ss_validIDCardNo;


@end






