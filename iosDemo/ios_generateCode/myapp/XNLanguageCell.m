//
//  XNLanguageCell.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLanguageCell.h"

@interface XNLanguageCell()

@end


@implementation XNLanguageCell

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self.contentView addSubview:self.iconImageView];
[self.contentView addSubview:self.languageLabel];
[self.contentView addSubview:self.selectedImageView];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.languageLabel mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {

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
- (UILabel *)languageLabel
{
	if(!_languageLabel) {
		_languageLabel = createView(UILabel);
		[_languageLabel ss_setText:nil
         Font:nil
         TextColor:nil
         BackgroundColor:nil];


	}
	return _languageLabel;
}
- (UIImageView *)selectedImageView
{
	if(!_selectedImageView) {
		_selectedImageView = createView(UIImageView);
		_selectedImageView.image = UIImageWithName(@"");


	}
	return _selectedImageView;
}


@end

