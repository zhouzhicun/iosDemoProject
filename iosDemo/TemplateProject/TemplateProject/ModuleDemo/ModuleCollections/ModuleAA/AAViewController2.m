//
//  AAViewController2.m
//  
//
//  Created by zzc on 2020/1/3.
//

#import "AAViewController2.h"
#import "AAViewController3.h"

#import "XNVCAnchorHeader.h"

@interface AAViewController2 ()

@end

@implementation AAViewController2

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
    
    AAViewController3 *vc = [[AAViewController3 alloc] init];
    vc.vcCallBack = ^(NSDictionary *params) {
        NSLog(@"测试callback");
    };
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
