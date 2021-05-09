//
//  XNGoogleAuthVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNGoogleAuthVM.h"

@interface XNGoogleAuthVC : XNLViewController

@property (nonatomic, strong, readonly) XNGoogleAuthVM *viewModel;

- (instancetype)initWithVM:(XNGoogleAuthVM *)viewModel;

@property(nonatomic, strong)XNGoogleAuthFooterView *footerView;
@property(nonatomic, strong)XNLIconInputCell *ggCodeCell;
@property(nonatomic, strong)XNLIconInputCell *ggOldCodeCell;
@property(nonatomic, strong)XNImageAuthCodeCell *imageAuthCell;
@property(nonatomic, strong)XNFetchAuthCodeCell *fetchAuthCell;
@property(nonatomic, strong)XNLPasswordCell *pwdCell;
@property(nonatomic, strong)XNLPasswordCell *confirmPwdCell;


@end

