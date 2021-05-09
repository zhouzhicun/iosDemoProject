//
//  XNPayBindDetailEmptyView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNPayBindDetailEmptyView.h"

@interface XNPayBindDetailEmptyView()

@end


@implementation XNPayBindDetailEmptyView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.tipImageView];
[self addSubview:self.bindButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {

}];

[self.bindButton mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (UIImageView *)tipImageView
{
	if(!_tipImageView) {
		_tipImageView = createView(UIImageView);
		_tipImageView.image = UIImageWithName(@"");


	}
	return _tipImageView;
}
- (XNLCommonButton *)bindButton
{
	if(!_bindButton) {
		_bindButton = createView(XNLCommonButton);
		[_bindButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_bindButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _bindButton;
}


@end

