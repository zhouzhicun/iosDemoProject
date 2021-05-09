//
//  BBViewController1.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "BBViewController1.h"

#import "XNRouter.h"
#import "XNRouterProtocols.h"
#import "XNVCAnchorHeader.h"

@interface BBViewController1 ()

@end

@implementation BBViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)onClick:(UIButton *)btn {
    
    id<Module_Protocol_AA> moduleAA = (id<Module_Protocol_AA>)[XNRouter sharedInstance];
    UIViewController *a2VC = [moduleAA getA2VCWithUserId:@"1111" orderId:@"2222"];
    [self.navigationController pushViewController:a2VC animated:YES];
}


@end
