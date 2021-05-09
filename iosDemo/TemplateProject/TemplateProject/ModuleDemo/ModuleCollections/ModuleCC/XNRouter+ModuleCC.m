//
//  XNRouter+ModuleCC.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNRouter+ModuleCC.h"

#import "CCViewController1.h"
#import "CCViewController2.h"
#import "CCViewController3.h"

@implementation XNRouter (ModuleCC)

- (UIViewController *)getC1ViewController
{
    CCViewController1 *vc = [[CCViewController1 alloc] init];
    vc.title = @"CC1";
    return vc;
}

@end
