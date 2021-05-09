//
//  XNRegisterFooterView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNRegisterFooterView.h"

@interface XNRegisterFooterView()

@end


@implementation XNRegisterFooterView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.doneButton];
[self addSubview:self.changeButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLCommonButton *)doneButton
{
	if(!_doneButton) {
		_doneButton = createView(XNLCommonButton);
		[_doneButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_doneButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _doneButton;
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

