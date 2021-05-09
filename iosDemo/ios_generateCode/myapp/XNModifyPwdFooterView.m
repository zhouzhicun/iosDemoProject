//
//  XNModifyPwdFooterView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNModifyPwdFooterView.h"

@interface XNModifyPwdFooterView()

@end


@implementation XNModifyPwdFooterView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.submitButton];

}

- (void)setupConstraint
{
    WEAKSELF;
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

