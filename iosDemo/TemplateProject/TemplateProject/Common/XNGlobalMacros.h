//
//  XNCommonMacros.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#ifndef XNCommonMacros_h
#define XNCommonMacros_h


#pragma mark - 系统版本,语言, AppName, App版本

#define kSystemVersion        ([[UIDevice currentDevice] systemVersion])
#define kCurrentLanguage      ([[NSLocale preferredLanguages] objectAtIndex:0])
#define kAPPName              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
#define kAPPVersion           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#pragma mark - 屏幕尺寸
#define kScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight         ([UIScreen mainScreen].bounds.size.height)

#pragma mark - 设置颜色
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HEXCOLOR(hex)           RGBCOLOR((float)((hex & 0xFF0000) >> 16),(float)((hex & 0xFF00) >> 8),(float)(hex & 0xFF))
#define HEXACOLOR(hex, a)       RGBACOLOR((float)((hex & 0xFF0000) >> 16),(float)((hex & 0xFF00) >> 8),(float)(hex & 0xFF), a)


#pragma mark - weakSelf

#define WEAKSELF             __weak   typeof(self)  weakSelf = self;
#define STRONGSELF           __strong typeof(weakSelf) strongSelf = weakSelf;

#pragma mark - 空对象,空字符串
#define isNullObj(x)         (!x || [x isKindOfClass:[NSNull class]])
#define isEmptyString(x)     (isNullObj(x) || [x isEqual:@""] || [x isEqual:@"(null)"])
#define isNotEmptyString(x)  (x && [x isKindOfClass:[NSString class]] && ([x length] > 0))

#pragma mark - 创建View
#define createView(Class)                       [[Class alloc] init]
#define createViewWithFrame(Class, frame)       [[Class alloc] initWithFrame:frame]
#define UIImageWithName(imageName)              [UIImage imageNamed:imageName]


#pragma mark - 密码正则表达式
#define PasswordPredicate1 @"^\\d+$"                    //纯数字
#define PasswordPredicate2 @"^[a-z]+$"                  //纯小写字母
#define PasswordPredicate3 @"^[A-Z]+$"                  //纯大写字母
#define PasswordPredicate4 @"^[^0-9a-zA-Z]+$"           //纯符号
#define PasswordPredicate5 @"\\s+"//@"\\s+"             //空格
#define PasswordPredicate6 @"[\u4e00-\u9fa5]"           //中文
#define PasswordPredicate7 @"^[\u4e00-\u9fa5.·]+$"      //必须是中文和".""·"
#define PasswordPredicate8 @"^[A-Za-z]+$"               //26个字符 大小写


#pragma mark - 单例

#undef AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}



#pragma mark - 合成属性(常用于类别中添加属性)

//C类型，例如int, char, bool, 结构体等等
#ifndef SYNTH_DYNAMIC_PROPERTY_CTYPE
#define SYNTH_DYNAMIC_PROPERTY_CTYPE(_getter_, _setter_, _type_) \
- (void)_setter_ : (_type_)object { \
[self willChangeValueForKey:@#_getter_]; \
NSValue *value = [NSValue value:&object withObjCType:@encode(_type_)]; \
objc_setAssociatedObject(self, _cmd, value, OBJC_ASSOCIATION_RETAIN); \
[self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
_type_ cValue = { 0 }; \
NSValue *value = objc_getAssociatedObject(self, @selector(_setter_:)); \
[value getValue:&cValue]; \
return cValue; \
}
#endif


//OC对象( @param association  ASSIGN / RETAIN / COPY / RETAIN_NONATOMIC / COPY_NONATOMIC)
#ifndef SYNTH_DYNAMIC_PROPERTY_OBJECT
#define SYNTH_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_)object { \
[self willChangeValueForKey:@#_getter_]; \
objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_ ## _association_); \
[self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
return objc_getAssociatedObject(self, @selector(_setter_:)); \
}
#endif




#pragma mark - 日志

#ifdef DEBUG

#define XNLog(fmt, ...)  NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

#define XNLog(fmt, ...)

#endif



#pragma mark - 计时

#ifdef DEBUG

#define TICK  CFTimeInterval startTime = CACurrentMediaTime();
#define TOCK  CFTimeInterval endTime = CACurrentMediaTime(); \
XNLog(@"Total Runtime: %g s", endTime - startTime);

#else

#define TICK
#define TOCK

#endif




#endif /* XNCommonMacros_h */
