//
//  XNRegisterVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNRegisterVM.h"

@interface XNRegisterVC : XNLViewController

@property (nonatomic, strong, readonly) XNRegisterVM *viewModel;

- (instancetype)initWithVM:(XNRegisterVM *)viewModel;

@property(nonatomic, strong)XNLoginHeaderView *headerView;
@property(nonatomic, strong)XNRegisterFooterView *footerView;
@property(nonatomic, strong)XNLIconInputCell *mobileCell;
@property(nonatomic, strong)XNImageAuthCodeCell *imageAuthCell;
@property(nonatomic, strong)XNFetchAuthCodeCell *fetchAuthCell;
@property(nonatomic, strong)XNLPasswordCell *pwdCell;
@property(nonatomic, strong)XNLPasswordCell *confirmPwdCell;
@property(nonatomic, strong)XNLIconInputCell *inviteCodeCell;


@end

