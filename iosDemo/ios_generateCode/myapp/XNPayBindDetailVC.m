//
//  XNPayBindDetailVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNPayBindDetailVC.h"

@interface XNPayBindDetailVC()

@end


@implementation XNPayBindDetailVC

- (instancetype)initWithVM:(XNPayBindDetailVM *)viewModel {
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
    [self.view addSubview:self.bankCardCell];
[self.view addSubview:self.zfbCell];
[self.view addSubview:self.wxCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.bankCardCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.zfbCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.wxCell mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNPayBindDetailCell *)bankCardCell
{
	if(!_bankCardCell) {
		_bankCardCell = createView(XNPayBindDetailCell);
		
	}
	return _bankCardCell;
}
- (XNPayBindDetailCell *)zfbCell
{
	if(!_zfbCell) {
		_zfbCell = createView(XNPayBindDetailCell);
		
	}
	return _zfbCell;
}
- (XNPayBindDetailCell *)wxCell
{
	if(!_wxCell) {
		_wxCell = createView(XNPayBindDetailCell);
		
	}
	return _wxCell;
}


@end

