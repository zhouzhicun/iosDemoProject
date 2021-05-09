//
//  XNSettingLoginedHeaderView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNSettingLoginedHeaderView.h"

@interface XNSettingLoginedHeaderView()

@end


@implementation XNSettingLoginedHeaderView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.headImageView];
[self addSubview:self.mobileLabel];
[self addSubview:self.authImageView];
[self addSubview:self.tipLabel];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.mobileLabel mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.authImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {

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
- (UILabel *)mobileLabel
{
	if(!_mobileLabel) {
		_mobileLabel = createView(UILabel);
		[_mobileLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _mobileLabel;
}
- (UIImageView *)authImageView
{
	if(!_authImageView) {
		_authImageView = createView(UIImageView);
		_authImageView.image = UIImageWithName(@"");


	}
	return _authImageView;
}
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


@end

