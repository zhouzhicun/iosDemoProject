//
//  UIViewController+XNRouter.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "UIViewController+XNCallBack.h"
@import ObjectiveC.runtime;

@implementation UIViewController (XNCallBack)

SYNTH_DYNAMIC_PROPERTY_OBJECT(vcCallBack, setVcCallBack, COPY, XNVCCallBack);

@end
