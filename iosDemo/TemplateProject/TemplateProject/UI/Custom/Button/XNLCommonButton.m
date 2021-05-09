//
//  XNLCommonButton.m
//  XNLoan
//
//  Created by xiaoniu on 16/7/4.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLCommonButton.h"


@interface XNLCommonButton ()

@end

@implementation XNLCommonButton


#pragma mark - 点击区域处理

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*) event {
    
    UIEdgeInsets edgeInset = self.touchEdgeInset;
    CGRect rect = CGRectMake(self.bounds.origin.x - edgeInset.left,
                             self.bounds.origin.y - edgeInset.top,
                             self.bounds.size.width + edgeInset.left + edgeInset.right,
                             self.bounds.size.height + edgeInset.top + edgeInset.bottom);
    
    BOOL isEdgeInsetZero = UIEdgeInsetsEqualToEdgeInsets(edgeInset, UIEdgeInsetsZero);
    BOOL isInvalidView = self.hidden || self.alpha == 0 || !self.enabled || !self.isUserInteractionEnabled;
    
    if (isInvalidView) {
        return [super hitTest:point withEvent:event];
    } else {
        if (isEdgeInsetZero) {
            return [super hitTest:point withEvent:event];
        } else {
            return CGRectContainsPoint(rect, point) ? self : nil;
        }
    }
    
    return nil;
}


@end
