//
//  AppDelegate.m
//  TemplateProject
//
//  Created by zzc on 2020/1/1.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (NSInteger)calcWaysWithA:(NSInteger)A B:(NSInteger)B C:(NSInteger)C
{
    NSInteger maxB = A / B + 1;
    NSInteger maxC = A / C + 1;
    
    NSInteger total = 0;
    for (int i = 0; i < maxB; ++i) {
        for (int j = 0; j < maxC; ++j) {
            if (i * B + j * C == A) {
                total += 1;
            }
        }
    }
    
    return total;
}




- (NSInteger)calcArr:(NSArray *)arr k:(NSInteger)k
{
    NSInteger count = arr.count;
    if (count == 0) {
        return 0;
    }
    
    //初始化
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < count; ++count) {
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:0];
        [resultArr addObject:subArr];
        for (int j = 0; j < count; ++j) {
            [resultArr addObject:@(0)];
        }
    }
    
    
    for (int i = 0; i < count; ++i) {
        
        resultArr[i][i] = arr[i];
        if (i > 0) {
            for (int j = 0; j < i; j++) {
                resultArr[j][i] =
                @([resultArr[j][i-1] integerValue] + [arr[i] integerValue]);
            }
        }
    }
    
    NSInteger total = 0;
    for (int i = 0; i < count; ++i) {
        for (int j = 0; j < i; ++j) {
            if ([resultArr[i][j] integerValue] == k) {
                total += 1;
            }
        }
    }
    
    return total;
}



@end



