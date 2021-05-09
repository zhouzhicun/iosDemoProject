//
//  AAViewController3.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "AAViewController3.h"

#import "XNVCAnchorHeader.h"


@interface AAViewController3 ()

@end

@implementation AAViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回到锚点" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(80, 250, 200, 80);
    [self.view addSubview:button];
}




- (void)onClick:(UIButton *)btn {
    
    //测试回调
    if (self.vcCallBack) {
        self.vcCallBack(@{@"name" : @"hao111"});
    }
}


- (void)onBack:(UIButton *)btn {
    //测试锚点返回
    [self.navigationController popToAnchorViewControllerAnimated:YES];
}


@end
