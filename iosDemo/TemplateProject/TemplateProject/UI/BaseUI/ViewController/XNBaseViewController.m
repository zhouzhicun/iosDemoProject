//
//  XNBaseViewController.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseViewController.h"
//RunTime
#import <objc/runtime.h>
#import "NSError+XNNetwork.h"

@interface XNBaseViewController ()

//背景
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation XNBaseViewController

#pragma mark - Init

//提供viewModel的get/set方法，便于父类其他方法中获取viewModel
- (void)setViewModel:(id)viewModel {}
- (XNBaseViewModel *)viewModel {
    return nil;
}


#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1 base初始化
    [self defaultInit];
    [self commonInit];
}

#pragma mark - commonInit

- (void)defaultInit {
    
    //1 设置背景色
    
    
    //2 以导航栏左下角为原点，进行布局; 默认是以以屏幕左上角为原点。
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (@available(iOS 11.0, *)) {} else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

- (void)commonInit {
    //2 设置UI
    [self configNavigationBar];
    [self setupSubView];
    [self setupConstraint];
    [self setupEvent];
    [self setupBinding];
    
}

#pragma mark - UI模板方法
- (void)configNavigationBar {
//    //设置返回按钮
//    @weakify(self);
//    CGFloat offset = 14;
//    [self ss_addBarButtonWithNormalImageName:nil
//                          highLightImageName:nil
//                           barButtonItemType:SSBarButtonItemTypeLeft
//                                      offset:offset
//                                pressedBlock:^(UIButton *button){
//                                    @strongify(self);
//                                    [self backButtonPressed:button];
//                                }];
}
- (void)setupSubView{}
- (void)setupConstraint{}
- (void)setupEvent{}
- (void)setupBinding {
    self.title = self.viewModel.navBarTitle;
    [self bindUISubject];
    [self bindRequestSubject];
}


- (void)bindUISubject
{
    @weakify(self);
    [[self.viewModel.toastSubject deliverOnMainThread] subscribeNext:^(NSString *message) {
        @strongify(self);
        [self showToastWithText:message];
    }];
    [[self.viewModel.loadingSubject deliverOnMainThread] subscribeNext:^(NSNumber *show) {
        @strongify(self);
        if (show && [show boolValue]) {
            [self showHud];
        } else {
            [self hideHud];
        }
    }];
}


- (void)bindRequestSubject
{
    @weakify(self);
    [[self.viewModel.successSubject deliverOnMainThread] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self dispatchSuccessWithEvent:tuple.first data:tuple.second];
    }];
    
    [[self.viewModel.errorSubject deliverOnMainThread] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self dispatchErrorWithEvent:tuple.first data:tuple.second];
    }];
}


//分发处理请求成功
- (void)dispatchSuccessWithEvent:(NSString *)event data:(id)data {}

//分发处理请求失败
- (void)dispatchErrorWithEvent:(NSString *)event data:(id)data {
    
    //默认实现
    NSError *err = (NSError *)data;
    [self showToastWithText:[err ss_message]];
}


#pragma mark - 其他

- (void)backButtonPressed:(id)sender
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hideKeyBoard {
    [self.view endEditing:YES];
}


/* 用于界面中textfiled的RAC绑定 */
- (void)binding:(UITextField *)textfield channel:(RACChannelTerminal *)channel {
    RACChannelTerminal *textFieldChannel = textfield.rac_newTextChannel;
    [channel subscribe:textFieldChannel];
    [textFieldChannel subscribe:channel];
}


#pragma mark - Private

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Getter

- (MBProgressHUD *)hud
{
    if (!_hud) {
        
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//        _hud.bezelView.backgroundColor = [UIColor clearColor];
//
//        _hud.minSize = CGSizeMake(120.0f, 25.0f);
//        _hud.margin = 0.f;
//        _hud.animationType = MBProgressHUDAnimationFade;
//        _hud.detailsLabel.font = scaleFontSize(13);
//        _hud.removeFromSuperViewOnHide = YES;
        
    }
    
    return _hud;
    
}

@end
