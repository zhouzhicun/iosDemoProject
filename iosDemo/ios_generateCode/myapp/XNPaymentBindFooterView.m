//
//  XNPaymentBindFooterView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNPaymentBindFooterView.h"

@interface XNPaymentBindFooterView()

@end


@implementation XNPaymentBindFooterView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.zfbButton];
[self addSubview:self.submitButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.zfbButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLCommonButton *)zfbButton
{
	if(!_zfbButton) {
		_zfbButton = createView(XNLCommonButton);
		[_zfbButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_zfbButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _zfbButton;
}
- (XNLCommonButton *)submitButton
{
	if(!_submitButton) {
		_submitButton = createView(XNLCommonButton);
		[_submitButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_submitButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _submitButton;
}


@end

