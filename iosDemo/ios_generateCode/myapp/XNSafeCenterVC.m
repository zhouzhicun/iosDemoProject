//
//  XNSafeCenterVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNSafeCenterVC.h"

@interface XNSafeCenterVC()

@end


@implementation XNSafeCenterVC

- (instancetype)initWithVM:(XNSafeCenterVM *)viewModel {
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
    [self.view addSubview:self.loginPwdCell];
[self.view addSubview:self.assetPwdCell];
[self.view addSubview:self.googleAuthCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.loginPwdCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.assetPwdCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.googleAuthCell mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLCommonCell *)loginPwdCell
{
	if(!_loginPwdCell) {
		_loginPwdCell = createView(XNLCommonCell);
		
	}
	return _loginPwdCell;
}
- (XNLSwitchCell *)assetPwdCell
{
	if(!_assetPwdCell) {
		_assetPwdCell = createView(XNLSwitchCell);
		
	}
	return _assetPwdCell;
}
- (XNLSwitchCell *)googleAuthCell
{
	if(!_googleAuthCell) {
		_googleAuthCell = createView(XNLSwitchCell);
		
	}
	return _googleAuthCell;
}


@end

