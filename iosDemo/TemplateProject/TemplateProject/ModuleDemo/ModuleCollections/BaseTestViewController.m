//
//  BaseTestViewController.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "BaseTestViewController.h"

@interface BaseTestViewController ()

@end

@implementation BaseTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"按我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(80, 100, 200, 80);
    [self.view addSubview:button];
}


- (void)onClick:(UIButton *)btn {
    //子类实现
}

@end
