//
//  UIDevice+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (SSToolkitAdditions)


#pragma mark - 系统

/* os类型:iOS */
- (NSString *)ss_getOSType;

/* os版本 */
- (NSString *)ss_getOSVersion;

#pragma mark - 设备

/* 设备类型:iPhone7,2 */
- (NSString *)ss_getDeviceType;

/* 分辨率 */
- (NSString *)ss_getResolution;

#pragma mark -- CPU

//number of cpus
- (NSUInteger)ss_cpuCount;

//CPU Frequency
- (NSUInteger)ss_cpuFrequency;


#pragma mark -- Memory

//total memory
- (long long)ss_totalMemory;

//non-kernel memory
- (NSUInteger)ss_userMemory;

#pragma mark - 磁盘容量

-(long long)ss_getTotalDiskSize;

-(long long)ss_getAvailableDiskSize;

#pragma mark -- 电量

/* 获取电池电量 */
-(CGFloat)ss_getBatteryQuantity;

/* 获取电池状态 */
-(UIDeviceBatteryState)ss_getBatteryStauts;



#pragma mark -- MAC地址

- (NSString *) ss_MACAddress;



#pragma mark -- IP地址

- (NSString *)ss_deviceIPAdress;

#pragma mark - Helper

-(NSString *)ss_fileSizeToString:(unsigned long long)fileSize;


@end
