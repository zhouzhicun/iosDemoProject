//
//  UIDevice+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "UIDevice+SSToolkitAdditions.h"

#include <sys/socket.h>
#include <sys/sysctl.h>
#import <sys/utsname.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/mount.h>


@implementation UIDevice (SSToolkitAdditions)


#pragma mark - 系统

/* os类型 */
- (NSString *)ss_getOSType {
    return @"iOS";
}

/* os版本 */
- (NSString *)ss_getOSVersion {
    return [[UIDevice currentDevice] systemVersion];
}


#pragma mark - 设备

/* 设备类型:iPhone7,2 */
- (NSString *)ss_getDeviceType {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

}

/* 分辨率 */
- (NSString *)ss_getResolution {
    
    CGRect rect     = [[UIScreen mainScreen] bounds];
    CGFloat scale   = [[UIScreen mainScreen] scale];
    CGFloat width   = rect.size.width * scale;
    CGFloat height  = rect.size.height * scale;
    NSString *resolution = [NSString stringWithFormat:@"%.0f*%.0f", width, height];
    return resolution;
}


#pragma mark -- CPU

//number of cpus
- (NSUInteger) ss_cpuCount
{
    return [self getSysInfo:HW_NCPU];
}

//CPU Frequency
- (NSUInteger) ss_cpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}



#pragma mark -- Memory

//total memory
- (long long)ss_totalMemory
{
    return [NSProcessInfo processInfo].physicalMemory;
}


//non-kernel memory
- (NSUInteger)ss_userMemory
{
    return [self getSysInfo:HW_USERMEM];
}


#pragma mark - 磁盘容量

-(long long)ss_getTotalDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return freeSpace;
}


-(long long)ss_getAvailableDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return freeSpace;
}


#pragma mark -- 电量

/* 获取电池电量 */
-(CGFloat)ss_getBatteryQuantity
{
    return [[UIDevice currentDevice] batteryLevel];
}

/* 获取电池状态(UIDeviceBatteryState为枚举类型) */
-(UIDeviceBatteryState)ss_getBatteryStauts {
    return [UIDevice currentDevice].batteryState;
}






#pragma mark -- MAC地址

- (NSString *) ss_MACAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Error: Memory allocation error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2\n");
        free(buf); // Thanks, Remy "Psy" Demerest
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    free(buf);
    return outstring;
}





#pragma mark -- IP地址

- (NSString *)ss_deviceIPAdress {
    
    NSString *address = nil;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return address;
}



#pragma mark - Helper

-(NSString *)ss_fileSizeToString:(unsigned long long)fileSize {
    
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;
    
    if (fileSize < 10)  {
        return @"0 B";
    }else if (fileSize < KB) {
        return @"< 1 KB";
    }else if (fileSize < MB) {
        return [NSString stringWithFormat:@"%.1f KB",((CGFloat)fileSize)/KB];
    }else if (fileSize < GB) {
        return [NSString stringWithFormat:@"%.1f MB",((CGFloat)fileSize)/MB];
    }else   {
        return [NSString stringWithFormat:@"%.1f GB",((CGFloat)fileSize)/GB];
    }
}


#pragma mark - sysctl & sysctlbyname

- (NSUInteger) getSysInfo: (uint) typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}


- (NSString *) getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}



@end
