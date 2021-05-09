//
//  XNLCommonDetailCell.m
//  
//
//  Created by xiaoniu on 16/6/17.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLCommonCell.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

#import "XNGlobalMacros.h"
#import "UIView+SSToolkitAdditions.h"

@interface XNLCommonCell ()

@property(nonatomic, assign)XNLCommonDetailCellType cellType;

@property(nonatomic, assign)CGFloat iconPadding;
@property(nonatomic, assign)CGFloat arrowPadding;
@property(nonatomic, assign)CGFloat titlePadding;
@property(nonatomic, assign)CGFloat valuePadding;

@property(nonatomic, strong)UIImageView *iconImageView;     //图标
@property(nonatomic, strong)UILabel *myTitleLabel;          //标题
@property(nonatomic, strong)UILabel *myValueLabel;          //值
@property(nonatomic, strong)UIImageView *arrowImageView;    //箭头

@end

@implementation XNLCommonCell

- (void)setupSubView {
    
    self.iconImageView  = [[UIImageView alloc] init];
    self.myTitleLabel   = [[UILabel alloc] init];
    self.myValueLabel   = [[UILabel alloc] init];
    self.arrowImageView = [[UIImageView alloc] init];
    
    //默认箭头
    self.arrowImageView.image = UIImageWithName(@"global_cell_arrow");

    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.myTitleLabel];
    [self.contentView addSubview:self.myValueLabel];
    [self.contentView addSubview:self.arrowImageView];

}

- (void)setupConstraint {

    @weakify(self);
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.leading.equalTo(self.contentView).offset(self.iconPadding);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.leading.equalTo(self.iconImageView.mas_trailing).offset(self.titlePadding);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.trailing.equalTo(self.contentView).offset(-(self.arrowPadding));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.myValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.trailing.equalTo(self.arrowImageView.mas_leading).offset(-(self.valuePadding));
        make.centerY.equalTo(self.contentView);
    }];
    
}


#pragma mark - Public

- (void)configCellWithModel:(XNLCommonCellModel *)model
{
    self.myTitleLabel.text = model.title;
    self.myValueLabel.text = model.value;
    self.iconImageView.image = !isEmptyString(model.iconName) ? [UIImage imageNamed:model.iconName] : nil;
    self.arrowImageView.image = !isEmptyString(model.arrowIconName) ? [UIImage imageNamed:model.arrowIconName] : nil;
}


- (void)configCellType:(XNLCommonDetailCellType)cellType
           IconPadding:(CGFloat)iconPadding
          TitlePadding:(CGFloat)titlePadding
          ValuePadding:(CGFloat)valuePadding
          ArrowPadding:(CGFloat)arrowPadding
{
    self.cellType     = cellType;
    self.iconPadding  = iconPadding;
    self.titlePadding = titlePadding;
    self.valuePadding = valuePadding;
    self.arrowPadding = arrowPadding;
    
    
    //更新约束
    switch (cellType) {
        case XNLCommonDetailCellType_Title_Value: {
            
            //标题+值
            [self updateTitleValueCellConstraints];
            break;
        }
        case XNLCommonDetailCellType_Title_Arrow: {
            
            //标题+箭头
            [self updateTitleArrowCellConstraints];
            break;
        }

        case XNLCommonDetailCellType_Title_Value_Arrow: {
            
            //标题+值+箭头
            [self updateTitleValueArrowCellConstraints];
            break;
        }
        case XNLCommonDetailCellType_Icon_Title_Arrow: {
            
            //图标+标题+箭头
            [self updateIconTitleArrowCellConstraints];
            break;
        }
        case XNLCommonDetailCellType_Icon_Title_Value_Arrow: {
            
            //图标+标题+值+箭头
            [self updateIconTitleValueArrowCellConstraints];
            break;
        }

    }
}






#pragma mark - 约束

- (void)configHideIcon:(BOOL)hideIcon Title:(BOOL)hideTitle Value:(BOOL)hideValue Arrow:(BOOL)hideArrow
{
    
    if (hideIcon) {
        [self.iconImageView removeFromSuperview];
        self.iconImageView = nil;
    }
    
    if (hideTitle) {
        [self.myTitleLabel removeFromSuperview];
        self.myTitleLabel = nil;
    }
    
    if (hideValue) {
        [self.myValueLabel removeFromSuperview];
        self.myValueLabel = nil;
    }
    
    if (hideArrow) {
        [self.arrowImageView removeFromSuperview];
        self.arrowImageView = nil;
    }
}

//标题+箭头
- (void)updateTitleArrowCellConstraints
{

    [self configHideIcon:YES Title:NO Value:YES Arrow:NO];
    
    @weakify(self);
    [self.myTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.leading.equalTo(self.contentView).offset(self.titlePadding);
        make.centerY.equalTo(self.contentView);

    }];
    
    [self.arrowImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.trailing.equalTo(self.contentView).offset(-(self.arrowPadding));
        make.centerY.equalTo(self.contentView);
    }];
    
}


//标题+值
- (void)updateTitleValueCellConstraints
{
    
    [self configHideIcon:YES Title:NO Value:NO Arrow:YES];
    
    
    @weakify(self);
    [self.myTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.leading.equalTo(self.contentView).offset(self.titlePadding);
        make.centerY.equalTo(self.contentView);
        
    }];
    
    [self.myValueLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.trailing.equalTo(self.contentView).offset(-(self.valuePadding));
        make.centerY.equalTo(self.contentView);
    }];
    
}



//标题+值+箭头
- (void)updateTitleValueArrowCellConstraints
{

    [self configHideIcon:YES Title:NO Value:NO Arrow:NO];
    
    @weakify(self);
    [self.myTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.leading.equalTo(self.contentView).offset(self.titlePadding);
        make.centerY.equalTo(self.contentView);
        
    }];
    
    [self.arrowImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.trailing.equalTo(self.contentView).offset(-(self.arrowPadding));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.myValueLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.trailing.equalTo(self.arrowImageView.mas_leading).offset(-(self.valuePadding));
        make.centerY.equalTo(self.contentView);
        
    }];
    
}

//图标+标题+箭头
- (void)updateIconTitleArrowCellConstraints
{
    [self configHideIcon:NO Title:NO Value:YES Arrow:NO];
    
    @weakify(self);
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(self.iconPadding);
    }];
    
    [self.myTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.centerY.equalTo(self.contentView);
        make.leading.equalTo(self.iconImageView.mas_trailing).offset(self.titlePadding);
        
    }];
    
    [self.arrowImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.centerY.equalTo(self.contentView);
        make.trailing.equalTo(self.contentView).offset(-(self.arrowPadding));
    }];
    


    
}

//图标+标题+值+箭头
- (void)updateIconTitleValueArrowCellConstraints
{

    [self configHideIcon:NO Title:NO Value:NO Arrow:NO];
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self).offset(self.iconPadding);
    }];
    
    [self.myTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self.iconImageView.mas_trailing).offset(self.titlePadding);
        
    }];
    
    [self.arrowImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.equalTo(self).offset(-(self.arrowPadding));
    }];
    
    
    [self.myValueLabel mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.trailing.equalTo(self.arrowImageView.mas_leading).offset(-(self.valuePadding));
    }];
    
}







@end
