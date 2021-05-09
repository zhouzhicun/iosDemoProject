//
//  XNAutoScaleUtils.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>


/************************************************/
//
// 获取各个机型的状态栏，导航栏，tabbar， bottom安全区域的高度
//
/************************************************/


//安全区域
UIEdgeInsets getSafeAreaInsets(void);

//状态栏高度
CGFloat getStatusBarHeight(void);

//导航栏高度
CGFloat getNavigationBarHeight(void);

//状态栏高度 + 导航栏高度
CGFloat getStatusAndNavBarHeight(void);

//tabbar高度
CGFloat getTabBarHeight(void);

//bottom安全区域高度
CGFloat getBottomSafeArea(void);

//是否全屏
BOOL isFullScreen(void);

