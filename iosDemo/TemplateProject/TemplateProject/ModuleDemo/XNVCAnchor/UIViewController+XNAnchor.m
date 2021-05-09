//
//  UIViewController+XNStack.m
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import "UIViewController+XNAnchor.h"
#import <objc/runtime.h>

@implementation UIViewController (XNAnchor)


#pragma mark - 创建或清除锚点

- (void)createAnchorWithPopBlock:(XNVCPopBackToAnchorBlock)popBlock {
    self.isAnchor = YES;
    self.popBackToAnchorBlock = popBlock;
}

//清除锚点并判断是否执行popBlock
- (void)clearAnchorAndExecuteBlock:(BOOL)execute {
    self.isAnchor = NO;
    if (execute && self.popBackToAnchorBlock) {
        self.popBackToAnchorBlock();
    }
    self.popBackToAnchorBlock = nil;
}



#pragma mark - 锚点

- (BOOL)isAnchor {
    return [(NSNumber *)objc_getAssociatedObject(self, @selector(isAnchor)) boolValue];
}

- (void)setIsAnchor:(BOOL)isAnchor {
    objc_setAssociatedObject(self, @selector(isAnchor), @(isAnchor), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - Block

- (XNVCPopBackToAnchorBlock)popBackToAnchorBlock {
    return objc_getAssociatedObject(self, @selector(popBackToAnchorBlock));
}

- (void)setPopBackToAnchorBlock:(XNVCPopBackToAnchorBlock)popBackToAnchorBlock {
    objc_setAssociatedObject(self, @selector(popBackToAnchorBlock), popBackToAnchorBlock, OBJC_ASSOCIATION_COPY);
}

@end
