//
//  XNRouter+ModuleWeb.m
//  TemplateProject
//
//  Created by zzc on 2020/1/8.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNRouter+ModuleWeb.h"
#import "XNWebViewController.h"

@implementation XNRouter (ModuleWeb)

- (UIViewController *)getWebVCWithUrlString:(NSString *)urlString {
    XNWebViewController *webVC = [[XNWebViewController alloc] init];
    webVC.urlString = urlString;
    return webVC;
}

@end
