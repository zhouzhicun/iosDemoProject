//
//  XNPayBindDetailCell.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNPayBindDetailCell.h"

@interface XNPayBindDetailCell()

@end


@implementation XNPayBindDetailCell

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self.contentView addSubview:self.iconImageView];
[self.contentView addSubview:self.payTypeLabel];
[self.contentView addSubview:self.containerView];
[self.contentView addSubview:self.backgroundImageView];
[self.contentView addSubview:self.accountTypeLabel];
[self.contentView addSubview:self.accountLabel];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.payTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.accountTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {

}];


}

- (void)setupEvent
{
    //WEAKSELF;
    
}


#pragma mark - Public

//- (void)bindModel:(NSDictionary *)model
//{
//
//}


#pragma mark - Setter 

- (UIImageView *)iconImageView
{
	if(!_iconImageView) {
		_iconImageView = createView(UIImageView);
		_iconImageView.image = UIImageWithName(@"");


	}
	return _iconImageView;
}
- (UILabel *)payTypeLabel
{
	if(!_payTypeLabel) {
		_payTypeLabel = createView(UILabel);
		[_payTypeLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _payTypeLabel;
}
- (UIView *)containerView
{
	if(!_containerView) {
		_containerView = createView(UIView);
		
	}
	return _containerView;
}
- (UIImageView *)backgroundImageView
{
	if(!_backgroundImageView) {
		_backgroundImageView = createView(UIImageView);
		_backgroundImageView.image = UIImageWithName(@"");


	}
	return _backgroundImageView;
}
- (UILabel *)accountTypeLabel
{
	if(!_accountTypeLabel) {
		_accountTypeLabel = createView(UILabel);
		[_accountTypeLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _accountTypeLabel;
}
- (UILabel *)accountLabel
{
	if(!_accountLabel) {
		_accountLabel = createView(UILabel);
		[_accountLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _accountLabel;
}


@end

