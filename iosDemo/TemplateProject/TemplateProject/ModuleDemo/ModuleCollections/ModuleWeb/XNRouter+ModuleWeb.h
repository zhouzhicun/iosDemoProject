//
//  XNRouter+ModuleWeb.h
//  TemplateProject
//
//  Created by zzc on 2020/1/8.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNRouterHeaders.h"
#import "XNRouterProtocols.h"

@interface XNRouter (ModuleWeb)

- (UIViewController *)getWebVCWithUrlString:(NSString *)urlString;

@end

