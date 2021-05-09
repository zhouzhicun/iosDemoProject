//
//  AAViewController1.m
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "AAViewController1.h"
#import "AAViewController2.h"

#import "XNVCAnchorHeader.h"

@interface AAViewController1 ()

@end

@implementation AAViewController1

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
    
    //锚点测试
    [self createAnchorWithPopBlock:^{
        NSLog(@"回到锚点啦");
    }];
    
    AAViewController2 *vc = [[AAViewController2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
