//
//  UINavigationController+SSToolkitAdditions.m
//  
//
//  Created by xiaoniu on 16/6/15.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "UINavigationController+SSToolkitAdditions.h"

@implementation UINavigationController (SSToolkitAdditions)


- (void)ss_setNavigationBarTransparent
{
    
    self.navigationBar.translucent = YES;
    
    //使得导航栏透明
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //隐藏导航栏下的黑线
    [self.navigationBar setShadowImage:[UIImage new]];
}



@end
