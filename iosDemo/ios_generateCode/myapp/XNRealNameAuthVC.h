//
//  XNRealNameAuthVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNRealNameAuthVM.h"

@interface XNRealNameAuthVC : XNLViewController

@property (nonatomic, strong, readonly) XNRealNameAuthVM *viewModel;

- (instancetype)initWithVM:(XNRealNameAuthVM *)viewModel;

@property(nonatomic, strong)XNGoogleAuthFooterView *footerView;
@property(nonatomic, strong)XNLTextInputCell *countryCell;
@property(nonatomic, strong)XNLTextInputCell *nameCell;
@property(nonatomic, strong)XNLTextInputCell *xingCell;
@property(nonatomic, strong)XNLTextInputCell *IDNoCell;


@end

