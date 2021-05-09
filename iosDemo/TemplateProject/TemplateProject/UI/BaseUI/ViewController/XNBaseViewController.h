//
//  XNBaseViewController.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MJRefresh.h"
#import "MBProgressHUD.h"

#import "XNBaseViewModel.h"
#import "UIViewController+XNAnchor.h"


typedef NS_ENUM(NSInteger, XNLBarButtonItemType) {
    XNLBarButtonItemTypeLeft,
    XNLBarButtonItemTypeRight
};


@interface XNBaseViewController : UIViewController

/* Hud */
@property (nonatomic, strong, readonly) MBProgressHUD *hud;

//Init
- (void)setViewModel:(id)viewModel;
- (XNBaseViewModel *)viewModel;


#pragma mark - UI模板方法
- (void)configNavigationBar; NS_REQUIRES_SUPER;
- (void)setupSubView;
- (void)setupConstraint;
- (void)setupEvent;
- (void)setupBinding NS_REQUIRES_SUPER;

#pragma mark - Public

- (void)hiddenNavigationBar:(BOOL)hidden animated:(BOOL)animated;
- (void)backButtonPressed:(id)sender;
- (void)hideKeyBoard;


#pragma mark - 绑定处理

- (void)bindUISubject;
- (void)bindRequestSubject;

//分发处理请求成功
- (void)dispatchSuccessWithEvent:(NSString *)event data:(id)data;

//分发处理请求失败
- (void)dispatchErrorWithEvent:(NSString *)event data:(id)data;


#pragma mark - 其他

/**
 * 用于界面中textfiled的RAC绑定, 例如:
 *
 * [self binding:self.mobileTextField channel:RACChannelTo(self.vm, mobile)];
 *
 */
- (void)binding:(UITextField *)textfield channel:(RACChannelTerminal *)channel;


@end

#import "XNBaseViewController+TipView.h"
