//
//  XNResetPasswordVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNResetPasswordVM.h"

@interface XNResetPasswordVC : XNLViewController

@property (nonatomic, strong, readonly) XNResetPasswordVM *viewModel;

- (instancetype)initWithVM:(XNResetPasswordVM *)viewModel;

@property(nonatomic, strong)XNLoginHeaderView *headerView;
@property(nonatomic, strong)XNResetPwdFooterView *footerView;
@property(nonatomic, strong)XNLIconInputCell *mobileCell;
@property(nonatomic, strong)XNImageAuthCodeCell *imageAuthCell;
@property(nonatomic, strong)XNFetchAuthCodeCell *fetchAuthCell;
@property(nonatomic, strong)XNLPasswordCell *pwdCell;
@property(nonatomic, strong)XNLPasswordCell *confirmPwdCell;


@end

