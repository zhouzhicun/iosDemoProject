//
//  XNLoginFooterView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLoginFooterView.h"

@interface XNLoginFooterView()

@end


@implementation XNLoginFooterView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.fotgetPwdButton];
[self addSubview:self.loginButton];
[self addSubview:self.registerButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.fotgetPwdButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];


}

- (void)setupEvent
{
    //WEAKSELF;
    
}



#pragma mark - Public

- (void)configView
{

}

#pragma mark - Setter 

- (XNLCommonButton *)fotgetPwdButton
{
	if(!_fotgetPwdButton) {
		_fotgetPwdButton = createView(XNLCommonButton);
		[_fotgetPwdButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_fotgetPwdButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _fotgetPwdButton;
}
- (XNLCommonButton *)loginButton
{
	if(!_loginButton) {
		_loginButton = createView(XNLCommonButton);
		[_loginButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_loginButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _loginButton;
}
- (XNLCommonButton *)registerButton
{
	if(!_registerButton) {
		_registerButton = createView(XNLCommonButton);
		[_registerButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_registerButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _registerButton;
}


@end

