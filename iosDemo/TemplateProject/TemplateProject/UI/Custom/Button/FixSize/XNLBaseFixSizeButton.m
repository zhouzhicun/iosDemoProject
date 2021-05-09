//
//  XNLCommonButton.m
//  XNLoan
//
//  Created by xiaoniu on 16/7/4.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLBaseFixSizeButton.h"

@interface XNLBaseFixSizeButton ()

@end

@implementation XNLBaseFixSizeButton

- (CGSize)intrinsicContentSize
{
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGSize textSize = self.titleLabel.intrinsicContentSize;
    
    CGFloat maxHeight = MAX(imageSize.height, textSize.height);
    return CGSizeMake(imageSize.width + textSize.width + self.space.floatValue, maxHeight);
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    switch (self.contentLayoutType) {
        case XNLButtonContentLayoutType_Center: {
            //居中对齐
            [self centerLayout];
            break;
        }
        case XNLButtonContentLayoutType_Linear_Leading: {
            //线性左对齐
            [self linearLeadingLayout];
            break;
        }
        case XNLButtonContentLayoutType_Linear_Tail: {
            //线性右对齐
            [self linearTailLayout];
            break;
        }
    }
}

///居中对齐
- (void)centerLayout
{}

//线性左布局
- (void)linearLeadingLayout
{}

//线性右布局
- (void)linearTailLayout
{}



@end
