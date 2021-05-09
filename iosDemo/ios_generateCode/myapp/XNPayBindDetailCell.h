//
//  XNPayBindDetailCell.h
//  TestABC
//
//  Created by zzc on 2020/01/02.
//  Copyright © 2019年 ynd. All rights reserved.
//


#import "XNLBaseTableViewCell.h"

@interface XNPayBindDetailCell : XNLBaseTableViewCell
@property(nonatomic, strong)UIImageView *iconImageView;
@property(nonatomic, strong)UILabel *payTypeLabel;
@property(nonatomic, strong)UIView *containerView;
@property(nonatomic, strong)UIImageView *backgroundImageView;
@property(nonatomic, strong)UILabel *accountTypeLabel;
@property(nonatomic, strong)UILabel *accountLabel;

@end

