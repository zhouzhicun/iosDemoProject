//
//  XNGoogleAuthVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNGoogleAuthVC.h"

@interface XNGoogleAuthVC()

@end


@implementation XNGoogleAuthVC

- (instancetype)initWithVM:(XNGoogleAuthVM *)viewModel {
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
[self.view addSubview:self.ggCodeCell];
[self.view addSubview:self.ggOldCodeCell];
[self.view addSubview:self.imageAuthCell];
[self.view addSubview:self.fetchAuthCell];
[self.view addSubview:self.pwdCell];
[self.view addSubview:self.confirmPwdCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.ggCodeCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.ggOldCodeCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.imageAuthCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.fetchAuthCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.pwdCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.confirmPwdCell mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNGoogleAuthFooterView *)footerView
{
	if(!_footerView) {
		_footerView = createView(XNGoogleAuthFooterView);
		
	}
	return _footerView;
}
- (XNLIconInputCell *)ggCodeCell
{
	if(!_ggCodeCell) {
		_ggCodeCell = createView(XNLIconInputCell);
		
	}
	return _ggCodeCell;
}
- (XNLIconInputCell *)ggOldCodeCell
{
	if(!_ggOldCodeCell) {
		_ggOldCodeCell = createView(XNLIconInputCell);
		
	}
	return _ggOldCodeCell;
}
- (XNImageAuthCodeCell *)imageAuthCell
{
	if(!_imageAuthCell) {
		_imageAuthCell = createView(XNImageAuthCodeCell);
		
	}
	return _imageAuthCell;
}
- (XNFetchAuthCodeCell *)fetchAuthCell
{
	if(!_fetchAuthCell) {
		_fetchAuthCell = createView(XNFetchAuthCodeCell);
		
	}
	return _fetchAuthCell;
}
- (XNLPasswordCell *)pwdCell
{
	if(!_pwdCell) {
		_pwdCell = createView(XNLPasswordCell);
		
	}
	return _pwdCell;
}
- (XNLPasswordCell *)confirmPwdCell
{
	if(!_confirmPwdCell) {
		_confirmPwdCell = createView(XNLPasswordCell);
		
	}
	return _confirmPwdCell;
}


@end

