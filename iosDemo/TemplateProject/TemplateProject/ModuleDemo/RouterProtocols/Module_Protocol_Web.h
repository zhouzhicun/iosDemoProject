//
//  Module_Protocol_Web.h
//  TemplateProject
//
//  Created by zzc on 2020/1/8.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Module_Protocol_Web <NSObject>

- (UIViewController *)getWebVCWithUrlString:(NSString *)urlString;
- (UIViewController *)getExampleWebVC;

@end

NS_ASSUME_NONNULL_END
