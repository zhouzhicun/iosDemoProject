//
//  XNRealNameAuthVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNRealNameAuthVC.h"

@interface XNRealNameAuthVC()

@end


@implementation XNRealNameAuthVC

- (instancetype)initWithVM:(XNRealNameAuthVM *)viewModel {
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
[self.view addSubview:self.countryCell];
[self.view addSubview:self.nameCell];
[self.view addSubview:self.xingCell];
[self.view addSubview:self.IDNoCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.countryCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.nameCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.xingCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.IDNoCell mas_makeConstraints:^(MASConstraintMaker *make) {

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
- (XNLTextInputCell *)countryCell
{
	if(!_countryCell) {
		_countryCell = createView(XNLTextInputCell);
		
	}
	return _countryCell;
}
- (XNLTextInputCell *)nameCell
{
	if(!_nameCell) {
		_nameCell = createView(XNLTextInputCell);
		
	}
	return _nameCell;
}
- (XNLTextInputCell *)xingCell
{
	if(!_xingCell) {
		_xingCell = createView(XNLTextInputCell);
		
	}
	return _xingCell;
}
- (XNLTextInputCell *)IDNoCell
{
	if(!_IDNoCell) {
		_IDNoCell = createView(XNLTextInputCell);
		
	}
	return _IDNoCell;
}


@end

