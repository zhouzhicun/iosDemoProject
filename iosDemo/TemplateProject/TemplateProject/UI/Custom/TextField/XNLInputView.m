//
//  XNLInputView.m
//  XNLoan
//
//  Created by xiaoniu on 16/7/22.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLInputView.h"

#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

#import "XNGlobalMacros.h"
#import "UIView+SSToolkitAdditions.h"

@interface XNLInputView ()

@property(nonatomic, strong)XNLTextFieldSideView *leftView;
@property(nonatomic, strong)XNLTextFieldSideView *rightView;

@property(nonatomic, strong)XNLInputFormatTextField *textField;

@end

@implementation XNLInputView

- (instancetype)init {
    
    //以默认frame初始化, 解决约束冲突问题
    return [self initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}



- (void)setupView
{
    self.textField = createView(XNLInputFormatTextField);
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    
    [self addSubview:self.textField];
}



#pragma mark - Public


- (void)setupConstraint
{
    @weakify(self);
    
    //1. 设置leftView
    [self.leftView ss_setContentHuggingPriority];
    CGSize leftViewSize = [self.leftView sideViewSize];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        
        make.width.equalTo(@(leftViewSize.width));
        make.height.equalTo(@(leftViewSize.height));
        
    }];
    


    UIView *tempRightView = self;

    //2. 设置rightView约束
    if (self.rightView) {
        [self.rightView ss_setContentHuggingPriority];
        CGSize rightViewSize = [self.rightView sideViewSize];
        [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            @strongify(self);
            make.right.equalTo(self);
            make.centerY.equalTo(self);
            make.width.equalTo(@(rightViewSize.width));
            make.height.equalTo(@(rightViewSize.height));
        }];
        
        tempRightView = self.rightView;
    }
    
    //3. 设置textField
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        @strongify(self);
        make.left.equalTo(self.leftView.mas_right);
        make.right.equalTo(self.rightView.mas_left);
        make.height.equalTo(@(32));
        make.centerY.equalTo(self);
    }];
    
}



#pragma mark - XNLTextFieldProtocol

- (XNLTextFieldSideView *)sideViewWithType:(XNLTextFieldSideViewType)type {
    if (type == XNLTextFieldSideViewType_Left) {
        return self.leftView;
    } else {
        return self.rightView;
    }
}


/**
 *  设置textfield的leftView或rightView
 */
- (void)setSideView:(XNLTextFieldSideView *)sideView
       SideViewType:(XNLTextFieldSideViewType)sideViewType {

    [self addSubview:sideView];
    if (sideViewType == XNLTextFieldSideViewType_Left) {
        
        //第一步: 移除旧sideView并添加新的sideView
        [self.leftView removeFromSuperview];
        self.leftView = sideView;
    } else {
        [self.rightView removeFromSuperview];
        self.rightView = sideView;
    }
}


/**
 *  同时设置textfield的leftView和rightView
 */
- (void)setLeftSideView:(XNLTextFieldSideView *)leftSideView
          RightSideView:(XNLTextFieldSideView *)rightSideView
{
    [self setSideView:leftSideView SideViewType:XNLTextFieldSideViewType_Left];
    [self setSideView:rightSideView SideViewType:XNLTextFieldSideViewType_Right];
}

@end
