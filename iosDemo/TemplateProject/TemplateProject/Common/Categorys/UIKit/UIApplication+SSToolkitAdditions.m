//
//  UIApplication+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "UIApplication+SSToolkitAdditions.h"


@implementation UIApplication (SSToolkitAdditions)

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)ss_getTopVC
{
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIViewController *result = nil;
    UIView *frontView = [[window subviews] lastObject];
    
    UIResponder *responder = [frontView nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            result = (UIViewController *)responder;
            break;
        } else {
            responder = [responder nextResponder];
        }
    }
    
    if (!result) {
        result = window.rootViewController;
    }
    
    return result;
}


@end





