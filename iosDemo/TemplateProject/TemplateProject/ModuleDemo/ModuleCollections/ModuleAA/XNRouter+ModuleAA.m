//
//  XNRouter+ModuleAA.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNRouter+ModuleAA.h"

#import "AAViewController1.h"
#import "AAViewController2.h"
#import "AAViewController3.h"

@implementation XNRouter (ModuleAA)

- (UIViewController *)getA1ViewController
{
    AAViewController1 *vc = [[AAViewController1 alloc] init];
    vc.title = @"AA1";
    return vc;
}

- (UIViewController *)getA2VCWithUserId:(NSString *)userId orderId:(NSString *)orderId
{
    AAViewController2 *vc = [[AAViewController2 alloc] init];
    vc.userId = userId;
    vc.orderId = orderId;
    vc.title = @"AA2";
    return vc;
}

- (UIViewController *)getA3VCWithParams:(NSDictionary *)params
{
    AAViewController3 *vc = [[AAViewController3 alloc] init];
    vc.params = params;
    vc.title = @"AA3";
    return vc;
}


@end
