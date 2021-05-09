//
//  XNLoginHeaderView.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLoginHeaderView.h"

@interface XNLoginHeaderView()

@end


@implementation XNLoginHeaderView

#pragma mark - UI 


- (void)setupSubView
{
    [super setupSubView];
    [self addSubview:self.iconImageView];

}

- (void)setupConstraint
{
    WEAKSELF;
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {

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

- (UIImageView *)iconImageView
{
	if(!_iconImageView) {
		_iconImageView = createView(UIImageView);
		_iconImageView.image = UIImageWithName(@"");


	}
	return _iconImageView;
}


@end

