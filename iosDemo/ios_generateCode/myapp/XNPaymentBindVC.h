//
//  XNPaymentBindVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLViewController.h"
#import "XNPaymentBindVM.h"

@interface XNPaymentBindVC : XNLViewController

@property (nonatomic, strong, readonly) XNPaymentBindVM *viewModel;

- (instancetype)initWithVM:(XNPaymentBindVM *)viewModel;

@property(nonatomic, strong)XNPaymentBindFooterView *footerView;
@property(nonatomic, strong)XNLTextInputCell *assetPwdCell;
@property(nonatomic, strong)XNLTextInputCell *nameCell;
@property(nonatomic, strong)XNLTextInputCell *bindMethodCell;
@property(nonatomic, strong)XNLTextInputCell *accountCell;


@end

