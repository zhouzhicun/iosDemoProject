//
//  Module_Protocol_A.h
//  TemplateProject
//
//  Created by zzc on 2020/1/3.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Module_Protocol_AA <NSObject>

- (UIViewController *)getA1ViewController;

- (UIViewController *)getA2VCWithUserId:(NSString *)userId orderId:(NSString *)orderId;

- (UIViewController *)getA3VCWithParams:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
