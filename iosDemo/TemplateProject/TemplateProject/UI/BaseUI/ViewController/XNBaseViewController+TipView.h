//
//  XNBaseViewController+Util.h
//  XNLoan
//
//  Created by xiaoniu on 16/7/25.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNBaseViewController.h"

@interface XNBaseViewController (TipView)


#pragma mark - Hud

- (void)showHud;
- (void)showHudOnSuperView:(UIView *)view;
- (void)hideHud;

#pragma mark - Toost
- (void)showToastWithText:(NSString *)text;
- (void)showToastWithText:(NSString *)text completion:(void(^)(BOOL didTap))completion;

@end
