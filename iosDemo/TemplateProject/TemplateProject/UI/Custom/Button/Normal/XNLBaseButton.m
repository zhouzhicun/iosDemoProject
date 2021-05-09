//
//  XNLCommonButton.m
//  XNLoan
//
//  Created by xiaoniu on 16/7/4.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLBaseButton.h"


@interface XNLBaseButton ()

@end

@implementation XNLBaseButton

- (CGSize)intrinsicContentSize
{
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGSize textSize = self.titleLabel.intrinsicContentSize;
    
    CGFloat maxHeight = MAX(imageSize.height, textSize.height);
    return CGSizeMake(imageSize.width + textSize.width + self.space.floatValue, maxHeight);
}

@end
