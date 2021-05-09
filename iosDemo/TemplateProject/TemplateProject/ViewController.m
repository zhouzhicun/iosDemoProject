//
//  ViewController.m
//  TemplateProject
//
//  Created by zzc on 2020/1/1.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "ViewController.h"

#import "XNRouter.h"
#import "XNRouterProtocols.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"组件化demo";
}

- (IBAction)onClickModuleAA:(id)sender {

    id<Module_Protocol_AA> moduleAA = (id<Module_Protocol_AA>)[XNRouter sharedInstance];
    UIViewController *a1VC = [moduleAA getA1ViewController];
    [self.navigationController pushViewController:a1VC animated:YES];

}

- (IBAction)onClickModuleBB:(id)sender {
    
    id<Module_Protocol_BB> moduleBB = (id<Module_Protocol_BB>)[XNRouter sharedInstance];
    UIViewController *b1VC = [moduleBB getB1ViewController];
    [self.navigationController pushViewController:b1VC animated:YES];
}

- (IBAction)onClickModuleCC:(id)sender {
    
    id<Module_Protocol_CC> moduleCC = (id<Module_Protocol_CC>)[XNRouter sharedInstance];
    UIViewController *c1VC = [moduleCC getC1ViewController];
    [self.navigationController pushViewController:c1VC animated:YES];
}


@end
