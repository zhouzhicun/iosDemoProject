//
//  XNFetchAuthCodeCell.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNFetchAuthCodeCell.h"

@interface XNFetchAuthCodeCell()

@end


@implementation XNFetchAuthCodeCell

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self.contentView addSubview:self.fetchButton];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.fetchButton mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (XNLCommonButton *)fetchButton
{
	if(!_fetchButton) {
		_fetchButton = createView(XNLCommonButton);
		[_fetchButton ss_setTitle:nil
	TitleFont:nil
 	NormalTitleColor:nil
 	HighLightTitleColor:nil];
[_fetchButton ss_setNormalBGImage:UIImageWithName(@"")
    HighlightBGImage:UIImageWithName(@"")];


	}
	return _fetchButton;
}


@end

