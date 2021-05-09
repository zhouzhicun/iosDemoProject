//
//  XNSwitchLanguageVC.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNSwitchLanguageVC.h"

@interface XNSwitchLanguageVC()

@end


@implementation XNSwitchLanguageVC

- (instancetype)initWithVM:(XNSwitchLanguageVM *)viewModel {
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
    [self.view addSubview:self.zhCell];
[self.view addSubview:self.enCell];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.zhCell mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.enCell mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLanguageCell *)zhCell
{
	if(!_zhCell) {
		_zhCell = createView(XNLanguageCell);
		
	}
	return _zhCell;
}
- (XNLanguageCell *)enCell
{
	if(!_enCell) {
		_enCell = createView(XNLanguageCell);
		
	}
	return _enCell;
}


@end

