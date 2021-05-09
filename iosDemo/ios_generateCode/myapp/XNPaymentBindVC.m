//
//  XNPaymentBindVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNPaymentBindVC.h"

@interface XNPaymentBindVC()

@end


@implementation XNPaymentBindVC

- (instancetype)initWithVM:(XNPaymentBindVM *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self.view addSubview:self.footerView];
[self.view addSubview:self.assetPwdCell];
[self.view addSubview:self.nameCell];
[self.view addSubview:self.bindMethodCell];
[self.view addSubview:self.accountCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.assetPwdCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.nameCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.bindMethodCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.accountCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];


}

- (void)setupEvent
{
    //WEAKSELF;
    
}



#pragma mark - ViewModel

- (void)setupBinding
{
    [super setupBinding];
}

#pragma mark - Private

- (void)backButtonPressed:(id)sender
{
    [self.view endEditing:YES];
    //返回
}

#pragma mark - Setter 

- (XNPaymentBindFooterView *)footerView
{
	if(!_footerView) {
		_footerView = createView(XNPaymentBindFooterView);
		
	}
	return _footerView;
}
- (XNLTextInputCell *)assetPwdCell
{
	if(!_assetPwdCell) {
		_assetPwdCell = createView(XNLTextInputCell);
		
	}
	return _assetPwdCell;
}
- (XNLTextInputCell *)nameCell
{
	if(!_nameCell) {
		_nameCell = createView(XNLTextInputCell);
		
	}
	return _nameCell;
}
- (XNLTextInputCell *)bindMethodCell
{
	if(!_bindMethodCell) {
		_bindMethodCell = createView(XNLTextInputCell);
		
	}
	return _bindMethodCell;
}
- (XNLTextInputCell *)accountCell
{
	if(!_accountCell) {
		_accountCell = createView(XNLTextInputCell);
		
	}
	return _accountCell;
}


@end

