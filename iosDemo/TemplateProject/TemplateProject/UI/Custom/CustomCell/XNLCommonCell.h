//
//  XNLCommonDetailCell.h
//  
//
//  Created by xiaoniu on 16/6/17.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XNBaseTableViewCell.h"
#import "XNLCommonCellModel.h"


typedef NS_ENUM(NSUInteger, XNLCommonDetailCellType) {
    
    XNLCommonDetailCellType_Title_Value = 0,         //标题+值
    XNLCommonDetailCellType_Title_Arrow,             //标题+箭头
    XNLCommonDetailCellType_Title_Value_Arrow,       //标题+值+箭头
    
    XNLCommonDetailCellType_Icon_Title_Arrow,        //图标+标题+箭头
    XNLCommonDetailCellType_Icon_Title_Value_Arrow,  //图标+标题+值+箭头
};



@interface XNLCommonCell : XNBaseTableViewCell


@property(nonatomic, strong, readonly)UIImageView *iconImageView;     //图标
@property(nonatomic, strong, readonly)UILabel *myTitleLabel;          //标题
@property(nonatomic, strong, readonly)UILabel *myValueLabel;          //值
@property(nonatomic, strong, readonly)UIImageView *arrowImageView;    //箭头

- (void)configCellWithModel:(XNLCommonCellModel *)model;

//设置
- (void)configCellType:(XNLCommonDetailCellType)cellType
           IconPadding:(CGFloat)iconPadding
          TitlePadding:(CGFloat)titlePadding
          ValuePadding:(CGFloat)valuePadding
          ArrowPadding:(CGFloat)arrowPadding;


@end
