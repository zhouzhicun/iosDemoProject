//
//  NSString+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "NSString+SSToolkitAdditions.h"

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>



@implementation NSMutableString (SSToolkitAdditions)

- (void)ss_appendNSDataBytes:(const unsigned char *)bytes Len:(NSUInteger)len {
    
    if (self) {
        for (int i = 0; i< len; ++i) {
            [self appendFormat:@"%02x", (unsigned int)bytes[i]];
        }
    }
}

@end



@implementation NSString (SSToolkitAdditions)

- (NSData *)ss_dataFromHexStr
{
    int len = (int)self.length / 2;
    char *result = (char *)malloc(len);
    bzero(result, len);
    unsigned int anInt = 0;
    for (int i = 0; i < len; ++i) {
        NSString *sub = [self substringWithRange:NSMakeRange(i*2, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:sub];
        [scanner scanHexInt:&anInt];
        result[i] = (char)anInt;
    }
    return [NSData dataWithBytes:result length:len];
}

- (NSData *)ss_data {
    
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}


- (NSUInteger)ss_hexValue {
    
    NSUInteger result = 0;
    sscanf([self UTF8String], "%lx", (unsigned long *)(&result));
    return result;
}

- (BOOL)ss_containsString:(NSString *)string {

    return !NSEqualRanges([self rangeOfString:string], NSMakeRange(NSNotFound, 0));
}

- (NSString *)ss_trim {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)ss_tailN:(NSInteger)count {
    
    NSRange range;
    if (self.length < count) {
        range = NSMakeRange(0, self.length);
    } else {
        range = NSMakeRange(self.length - count, count);
    }
    return [self substringWithRange:range];
}


- (NSString *)ss_trimAllSpace {

    //去掉所有空格
    NSString *temp = [self ss_trim];
    return [temp stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)ss_separatedByString:(NSString *)separatedStr
{
    NSArray *array = [self componentsSeparatedByString:separatedStr];
    NSString *firstStr = @"";
    if (array && array.count > 0) {
        firstStr = array[0];
    }
    return firstStr;
}






- (NSString *)ss_trimmingLeftCharactersInSet:(NSCharacterSet *)characterSet {
    
    long location = 0;
    long length = (long)[self length];

    for (location = 0; location < length; location++) {
        
        unichar ch = [self characterAtIndex:location];
        if (![characterSet characterIsMember:ch]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, length - location)];
}



- (NSString *)ss_trimmingRightCharactersInSet:(NSCharacterSet *)characterSet {
    
    long location = 0;
    long index = 0;

    for (index = (long)[self length]; index > 0; index--) {
    
        unichar ch = [self characterAtIndex:index-1];
        if (![characterSet characterIsMember:ch]) {
            break;
        }
    }
    
    return [self substringWithRange:NSMakeRange(location, index - location)];
}



- (NSUInteger)ss_numberOfLines {
    
    return [[self componentsSeparatedByString:@"\n"] count] + 1;
}





#pragma mark - HTML Methods

- (NSString *)ss_escapeHTML {
    
    NSMutableString *s = [NSMutableString string];
    
    NSUInteger start = 0;
    NSUInteger len = [self length];
    NSCharacterSet *chs = [NSCharacterSet characterSetWithCharactersInString:@"<>&\""];
    
    while (start < len) {
        NSRange r = [self rangeOfCharacterFromSet:chs options:0 range:NSMakeRange(start, len-start)];
        if (r.location == NSNotFound) {
            [s appendString:[self substringFromIndex:start]];
            break;
        }
        
        if (start < r.location) {
            [s appendString:[self substringWithRange:NSMakeRange(start, r.location-start)]];
        }
        
        switch ([self characterAtIndex:r.location]) {
                
            case '<':
                [s appendString:@"&lt;"];
                break;
            case '>':
                [s appendString:@"&gt;"];
                break;
            case '"':
                [s appendString:@"&quot;"];
                break;
//			case '…':
//				[s appendString:@"&hellip;"];
//				break;
            case '&':
                [s appendString:@"&amp;"];
                break;
        }
        
        start = r.location + 1;
    }
    
    return s;
}


- (NSString *)ss_unescapeHTML {
    
    NSMutableString *s = [NSMutableString string];
    NSMutableString *target = [self mutableCopy];
    NSCharacterSet *chs = [NSCharacterSet characterSetWithCharactersInString:@"&"];
    
    while ([target length] > 0) {
        NSRange r = [target rangeOfCharacterFromSet:chs];
        if (r.location == NSNotFound) {
            [s appendString:target];
            break;
        }
        
        if (r.location > 0) {
            [s appendString:[target substringToIndex:r.location]];
            [target deleteCharactersInRange:NSMakeRange(0, r.location)];
        }
        
        if ([target hasPrefix:@"&lt;"]) {
            [s appendString:@"<"];
            [target deleteCharactersInRange:NSMakeRange(0, 4)];
        } else if ([target hasPrefix:@"&gt;"]) {
            [s appendString:@">"];
            [target deleteCharactersInRange:NSMakeRange(0, 4)];
        } else if ([target hasPrefix:@"&quot;"]) {
            [s appendString:@"\""];
            [target deleteCharactersInRange:NSMakeRange(0, 6)];
        } else if ([target hasPrefix:@"&#39;"]) {
            [s appendString:@"'"];
            [target deleteCharactersInRange:NSMakeRange(0, 5)];
        } else if ([target hasPrefix:@"&amp;"]) {
            [s appendString:@"&"];
            [target deleteCharactersInRange:NSMakeRange(0, 5)];
        } else if ([target hasPrefix:@"&hellip;"]) {
            [s appendString:@"…"];
            [target deleteCharactersInRange:NSMakeRange(0, 8)];
        } else {
            [s appendString:@"&"];
            [target deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    
    return s;
}




#pragma mark - URL的UTF8编码解码

-(NSString *)ss_urlUTF8Encode {
    
    NSCharacterSet *charSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:charSet];

//    return [self stringByAddingPercentEscapesUsingEncoding:NSUnicodeStringEncoding];

}

-(NSString *)ss_urlUTF8Decode {
    
    return [self stringByRemovingPercentEncoding];
}



-(NSString *)ss_AFPercentEscapedString {
    
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @"/:#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    
    // FIXME: https://github.com/AFNetworking/AFNetworking/pull/3028
    // return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
    
    static NSUInteger const batchSize = 50;
    
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    
    while (index < self.length) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wgnu"
        NSUInteger length = MIN(self.length - index, batchSize);
#pragma GCC diagnostic pop
        NSRange range = NSMakeRange(index, length);
        
        // To avoid breaking up character sequences such as 👴🏻👮🏽
        range = [self rangeOfComposedCharacterSequencesForRange:range];
        
        NSString *substring = [self substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        

        [escaped appendString:encoded];
        
        index += range.length;
    }
    
    return escaped;
    
//    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                                                    (CFStringRef)self,
//                                                                                                    (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
//                                                                                                    NULL,
//                                                                                                    kCFStringEncodingUTF8));
//    return encodedString;
}





#pragma mark - 字符串校验


//正则表达式判断
- (BOOL)ss_regexPredicateWithPattern:(NSString *)pattern
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}



//判断是否为有效URL
-(BOOL)ss_isURL {
    
    NSString *pattern =
    @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    return [self ss_regexPredicateWithPattern:pattern];
}


//判断是否为中文字符串
-(BOOL)ss_isChinese {
    
    NSString *pattern=@"(^[\u4e00-\u9fa5]+$)";
    
    return [self ss_regexPredicateWithPattern:pattern];
}


//登录密码校验
- (BOOL)ss_validPassword {
    //NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}";
    //^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$
    
    //8-16位字符，大小写字母、数字均含，不含字符：
    //NSString *pattern = @"(?=^[A-Za-z\\d]{8,16}$)(?=.*\\d)(?=.*[A-Z])(?=.*[a-z]).*$";
    
    NSString *pattern = @"(?=^[(A-Z|a-z|\\W+)\\d]{8,}$)(?=.*\\d)(?=.*[(A-Z|a-z|\\W+)]).*$";
    return [self ss_regexPredicateWithPattern:pattern];
}


//判断是否为有效的email地址
- (BOOL)ss_validEmailAddr {
    
    NSString *pattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    return [self ss_regexPredicateWithPattern:pattern];

}

//判断是否未有效的手机号码
- (BOOL)ss_validMobileNum {
    
    //手机号以13， 15，17, 18开头，八个 \d 数字字符
    //NSString *pattern = @"^(1[3,5,7,8][0-9])\\d{8}$";
    NSString *pattern = @"[1]\\d{10}";
    
    return [self ss_regexPredicateWithPattern:pattern];
}





//校验用户固话号码
- (BOOL)ss_validPhoneNum {
    

    NSRegularExpression *regularexpression =
    [[NSRegularExpression alloc] initWithPattern:@"^\\d{3,4}-\\d{7,8}$"
                                         options:NSRegularExpressionCaseInsensitive
                                           error:nil];
    
    NSUInteger numberofMatch =
    [regularexpression numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    
    return (numberofMatch > 0) ? YES : NO;
}



//判断是否为有效的车牌号
- (BOOL)ss_validCarNo {
    
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:self];
}




//验证身份证
//必须满足以下规则
//1. 长度必须是18位，前17位必须是数字，第十八位可以是数字或X
//2. 前两位必须是以下情形中的一种：11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91
//3. 第7到第14位出生年月日。第7到第10位为出生年份；11到12位表示月份，范围为01-12；13到14位为合法的日期
//4. 第17位表示性别，双数表示女，单数表示男
//5. 第18位为前17位的校验位
//算法如下：
//（1）校验和 = (n1 + n11) * 7 + (n2 + n12) * 9 + (n3 + n13) * 10 + (n4 + n14) * 5 + (n5 + n15) * 8 + (n6 + n16) * 4 + (n7 + n17) * 2 + n8 + n9 * 6 + n10 * 3，其中n数值，表示第几位的数字
//（2）余数 ＝ 校验和 % 11
//（3）如果余数为0，校验位应为1，余数为1到10校验位应为字符串“0X98765432”(不包括分号)的第余数位的值（比如余数等于3，校验位应为9）
//6. 出生年份的前两位必须是19或20

- (BOOL)ss_validIDCardNo {
    
    NSString *value = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}


@end




