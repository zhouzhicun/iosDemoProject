//
//  XNSwitchLanguageVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNSwitchLanguageVM.h"

@interface XNSwitchLanguageVC : XNLViewController

@property (nonatomic, strong, readonly) XNSwitchLanguageVM *viewModel;

- (instancetype)initWithVM:(XNSwitchLanguageVM *)viewModel;

@property(nonatomic, strong)XNLanguageCell *zhCell;
@property(nonatomic, strong)XNLanguageCell *enCell;


@end

