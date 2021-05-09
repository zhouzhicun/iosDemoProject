//
//  XNAutoScaleUtils.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNFrameUtils.h"

//安全区域
inline UIEdgeInsets getSafeAreaInsets() {
    UIApplication *sharedApp = [UIApplication sharedApplication];
    CGRect statusFrame = sharedApp.statusBarFrame;
    BOOL hasBar = !sharedApp.statusBarHidden;
    
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        UIWindow *window = sharedApp.delegate.window;
        if (window) { safeAreaInsets = window.safeAreaInsets; }
    }
    
    if (hasBar && safeAreaInsets.top == 0.0f) {
        safeAreaInsets.top = statusFrame.size.height;
    }
    
    return safeAreaInsets;
}

//状态栏高度
inline CGFloat getStatusBarHeight() {
    return getSafeAreaInsets().top;
}

//导航栏高度
inline CGFloat getNavigationBarHeight() {
    return 44.0f;
}

//状态栏高度 + 导航栏高度
inline CGFloat getStatusAndNavBarHeight() {
    return getSafeAreaInsets().top + getNavigationBarHeight();
}

//tabbar高度
inline CGFloat getTabBarHeight() {
    return getSafeAreaInsets().bottom + 49.0f;
}

//bottom安全区域高度
inline CGFloat getBottomSafeArea() {
    return getSafeAreaInsets().bottom;
}

//是否全屏
inline BOOL isFullScreen() {
    return (getSafeAreaInsets().bottom > 0.0f);
}
