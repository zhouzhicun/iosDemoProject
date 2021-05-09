//
//  UIViewController+XNStack.h
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^XNVCPopBackToAnchorBlock)(void);


@interface UIViewController (XNAnchor)

//锚点
@property (nonatomic, assign, readonly) BOOL isAnchor;

#pragma mark - 创建或清除锚点

//创建锚点，并传入popBlock, block可为nil
- (void)createAnchorWithPopBlock:(XNVCPopBackToAnchorBlock)popBlock;


//清除锚点并根据execute是否执行popBlock
- (void)clearAnchorAndExecuteBlock:(BOOL)execute;

@end

