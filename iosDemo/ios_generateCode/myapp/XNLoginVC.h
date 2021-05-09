//
//  XNLoginVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNLoginVM.h"

@interface XNLoginVC : XNLViewController

@property (nonatomic, strong, readonly) XNLoginVM *viewModel;

- (instancetype)initWithVM:(XNLoginVM *)viewModel;

@property(nonatomic, strong)XNLoginHeaderView *headerView;
@property(nonatomic, strong)XNLoginFooterView *footerView;
@property(nonatomic, strong)XNLIconInputCell *mobileCell;
@property(nonatomic, strong)XNImageAuthCodeCell *imageAuthCell;
@property(nonatomic, strong)XNFetchAuthCodeCell *fetchAuthCell;
@property(nonatomic, strong)XNLPasswordCell *pwdCell;


@end

