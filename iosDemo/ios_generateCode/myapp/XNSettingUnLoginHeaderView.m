//
//  XNSettingUnLoginHeaderView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNSettingUnLoginHeaderView.h"

@interface XNSettingUnLoginHeaderView()

@end


@implementation XNSettingUnLoginHeaderView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.headImageView];
[self addSubview:self.registerButton];
[self addSubview:self.loginButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (UIImageView *)headImageView
{
	if(!_headImageView) {
		_headImageView = createView(UIImageView);
		_headImageView.image = UIImageWithName(@"");


	}
	return _headImageView;
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


@end

