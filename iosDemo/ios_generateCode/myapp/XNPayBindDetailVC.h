//
//  XNPayBindDetailVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNPayBindDetailVM.h"

@interface XNPayBindDetailVC : XNLViewController

@property (nonatomic, strong, readonly) XNPayBindDetailVM *viewModel;

- (instancetype)initWithVM:(XNPayBindDetailVM *)viewModel;

@property(nonatomic, strong)XNPayBindDetailCell *bankCardCell;
@property(nonatomic, strong)XNPayBindDetailCell *zfbCell;
@property(nonatomic, strong)XNPayBindDetailCell *wxCell;


@end

