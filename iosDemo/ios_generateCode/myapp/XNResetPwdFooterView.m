//
//  XNResetPwdFooterView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNResetPwdFooterView.h"

@interface XNResetPwdFooterView()

@end


@implementation XNResetPwdFooterView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.resetButton];
[self addSubview:self.changeButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.changeButton mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLCommonButton *)resetButton
{
	if(!_resetButton) {
		_resetButton = createView(XNLCommonButton);
		[_resetButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_resetButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _resetButton;
}
- (XNLCommonButton *)changeButton
{
	if(!_changeButton) {
		_changeButton = createView(XNLCommonButton);
		[_changeButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_changeButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _changeButton;
}


@end

