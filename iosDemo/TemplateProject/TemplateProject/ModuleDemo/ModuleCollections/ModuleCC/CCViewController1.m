//
//  CCViewController1.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "CCViewController1.h"

#import "XNRouter.h"
#import "XNRouterProtocols.h"
#import "XNVCAnchorHeader.h"


@interface CCViewController1 ()

@end

@implementation CCViewController1

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
    
//    id<Module_Protocol_AA> moduleAA = (id<Module_Protocol_AA>)[XNRouter sharedInstance];
//    UIViewController *a3VC = [moduleAA getA3VCWithParams:@{@"name" : @"zhouzhou"}];
//    [self.navigationController pushViewController:a3VC animated:YES];
    
    //跳baidu
    id<Module_Protocol_Web> moduleWeb = (id<Module_Protocol_Web>)[XNRouter sharedInstance];
    UIViewController *webVC = [moduleWeb getWebVCWithUrlString:@"https://www.baidu.com"];
    [self.navigationController pushViewController:webVC animated:YES];

    
    
//    //跳本地
//    id<Module_Protocol_Web> moduleWeb = (id<Module_Protocol_Web>)[XNRouter sharedInstance];
//    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
//    UIViewController *webVC = [moduleWeb getWebVCWithUrlString:htmlPath];
//    [self.navigationController pushViewController:webVC animated:YES];
    
    
//    id<Module_Protocol_Web> moduleWeb = (id<Module_Protocol_Web>)[XNRouter sharedInstance];
//    UIViewController *webVC = [moduleWeb getExampleWebVC];
//    [self.navigationController pushViewController:webVC animated:YES];

}

@end
