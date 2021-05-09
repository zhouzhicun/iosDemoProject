//
//  UIViewController+XNRouter.h
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNGlobalMacros.h"

typedef void(^XNVCCallBack)(NSDictionary *params);

@interface UIViewController (XNCallBack)

/**
 * 回调block，便于给上一VC传值
 * 主要用于模块内部VC跳转使用
 */
@property(nonatomic, copy)XNVCCallBack vcCallBack;

@end

