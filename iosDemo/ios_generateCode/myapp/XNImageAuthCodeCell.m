//
//  XNImageAuthCodeCell.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNImageAuthCodeCell.h"

@interface XNImageAuthCodeCell()

@end


@implementation XNImageAuthCodeCell

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self.contentView addSubview:self.authCodeImageView];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.authCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (UIImageView *)authCodeImageView
{
	if(!_authCodeImageView) {
		_authCodeImageView = createView(UIImageView);
		_authCodeImageView.image = UIImageWithName(@"");


	}
	return _authCodeImageView;
}


@end

