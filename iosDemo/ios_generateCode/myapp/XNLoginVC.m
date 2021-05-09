//
//  XNLoginVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLoginVC.h"

@interface XNLoginVC()

@end


@implementation XNLoginVC

- (instancetype)initWithVM:(XNLoginVM *)viewModel {
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
    [self.view addSubview:self.headerView];
[self.view addSubview:self.footerView];
[self.view addSubview:self.mobileCell];
[self.view addSubview:self.imageAuthCell];
[self.view addSubview:self.fetchAuthCell];
[self.view addSubview:self.pwdCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.mobileCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.imageAuthCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.fetchAuthCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.pwdCell mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLoginHeaderView *)headerView
{
	if(!_headerView) {
		_headerView = createView(XNLoginHeaderView);
		
	}
	return _headerView;
}
- (XNLoginFooterView *)footerView
{
	if(!_footerView) {
		_footerView = createView(XNLoginFooterView);
		
	}
	return _footerView;
}
- (XNLIconInputCell *)mobileCell
{
	if(!_mobileCell) {
		_mobileCell = createView(XNLIconInputCell);
		
	}
	return _mobileCell;
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


@end

