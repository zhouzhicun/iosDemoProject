//
//  UINavigationController+XNStack.h
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNStack.h"

@interface UINavigationController (XNAnchor)

//标记为锚点的VC栈
@property (nonatomic, strong, readonly) XNStack *anchorStack;

//pop到最后一个锚点VC, 如果没有锚点VC，则返回上一个界面
- (void)popToAnchorViewControllerAnimated:(BOOL)animated;

@end


