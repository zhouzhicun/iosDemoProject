//
//  XNGoogleAuthFooterView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNGoogleAuthFooterView.h"

@interface XNGoogleAuthFooterView()

@end


@implementation XNGoogleAuthFooterView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.tipLabel];
[self addSubview:self.zhengButton];
[self addSubview:self.fanButton];
[self addSubview:self.shouchiButton];
[self addSubview:self.submitButton];
[self addSubview:self.descLabel];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.zhengButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.fanButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.shouchiButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (UILabel *)tipLabel
{
	if(!_tipLabel) {
		_tipLabel = createView(UILabel);
		[_tipLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _tipLabel;
}
- (XNLCommonButton *)zhengButton
{
	if(!_zhengButton) {
		_zhengButton = createView(XNLCommonButton);
		[_zhengButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_zhengButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _zhengButton;
}
- (XNLCommonButton *)fanButton
{
	if(!_fanButton) {
		_fanButton = createView(XNLCommonButton);
		[_fanButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_fanButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _fanButton;
}
- (XNLCommonButton *)shouchiButton
{
	if(!_shouchiButton) {
		_shouchiButton = createView(XNLCommonButton);
		[_shouchiButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_shouchiButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _shouchiButton;
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
- (UILabel *)descLabel
{
	if(!_descLabel) {
		_descLabel = createView(UILabel);
		[_descLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _descLabel;
}


@end

