//
//  XNBaseViewController+Util.m
//  XNLoan
//
//  Created by xiaoniu on 16/7/25.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNBaseViewController+TipView.h"
//#import "UIView+Toast.h"

#pragma mark - Hud Messages

@implementation XNBaseViewController (TipView)

#pragma mark -- Hud

- (void)showHud
{}

- (void)hideHud
{}


- (void)showHudOnSuperView:(UIView *)view
{}



#pragma mark - Toast


- (void)showToastWithText:(NSString *)text
{}


- (void)showToastWithText:(NSString *)text completion:(void(^)(BOOL didTap))completion
{}


@end
