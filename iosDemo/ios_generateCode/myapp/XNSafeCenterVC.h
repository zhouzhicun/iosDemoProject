//
//  XNSafeCenterVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNSafeCenterVM.h"

@interface XNSafeCenterVC : XNLViewController

@property (nonatomic, strong, readonly) XNSafeCenterVM *viewModel;

- (instancetype)initWithVM:(XNSafeCenterVM *)viewModel;

@property(nonatomic, strong)XNLCommonCell *loginPwdCell;
@property(nonatomic, strong)XNLSwitchCell *assetPwdCell;
@property(nonatomic, strong)XNLSwitchCell *googleAuthCell;


@end

