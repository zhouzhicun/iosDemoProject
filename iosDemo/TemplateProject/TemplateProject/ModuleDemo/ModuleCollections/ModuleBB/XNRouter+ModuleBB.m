//
//  XNRouter+ModuleBB.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNRouter+ModuleBB.h"

#import "BBViewController1.h"
#import "BBViewController2.h"
#import "BBViewController3.h"

@implementation XNRouter (ModuleBB)

- (UIViewController *)getB1ViewController
{
    BBViewController1 *vc = [[BBViewController1 alloc] init];
    vc.title = @"BB1";
    return vc;
}

@end
