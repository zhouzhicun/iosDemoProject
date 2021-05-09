//
//  XNLTextFieldSideView.m
//  XNLoan
//
//  Created by xiaoniu on 16/7/14.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLTextFieldSideView.h"
#import "UIView+SSToolkitAdditions.h"
#import "XNGlobalMacros.h"
#import <Masonry/Masonry.h>

@interface XNLTextFieldSideView ()

@property (nonatomic, strong) NSValue *fixedSizeValue;

@end


@implementation XNLTextFieldSideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!CGRectEqualToRect(frame, CGRectZero)) {
           self.fixedSizeValue = [NSValue valueWithCGSize:frame.size];
        }
    }
    return self;
}

- (CGSize)sideViewSize
{
    CGSize resultSize = CGSizeZero;
    if (self.fixedSizeValue) {
        resultSize = [self.fixedSizeValue CGSizeValue];
    } else {
        resultSize = [self ss_calculateCompressedSize];
    }
    return resultSize;
}

@end
