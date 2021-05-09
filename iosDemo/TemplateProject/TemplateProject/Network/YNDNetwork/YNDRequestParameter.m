//
//
//  
//
//  Created by xiaoniu on 16/7/13.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "YNDRequestParameter.h"

@implementation YNDRequestParameter


#pragma mark - Public

+ (NSMutableDictionary *)headerParameters {
    
    NSMutableDictionary *headParameters = [[NSMutableDictionary alloc] initWithCapacity:0];

//    // 自定义http header参数
//    XNUtils *utils = [XNUtils sharedInstance];
//    [headParameters ss_setObject:[utils getToken]       forKey:kYNDHttpHeaderKey_Token];
//    [headParameters ss_setObject:[utils getChannelName] forKey:kYNDHttpHeaderKey_Channel];
//    [headParameters ss_setObject:[utils getChannelId]   forKey:kYNDHttpHeaderKey_ChannelId];
//
//    [headParameters ss_setObject:[utils getOSType]      forKey:kYNDHttpHeaderKey_OSType];
//    [headParameters ss_setObject:[utils getAppCode]  forKey:kYNDHttpHeaderKey_Version];
//
//    [headParameters ss_setObject:[utils getUUID]        forKey:kYNDHttpHeaderKey_DeviceId];
//    [headParameters ss_setObject:[utils getIDFA]        forKey:kYNDHttpHeaderKey_IDFA];
//    [headParameters ss_setObject:[utils getDeviceType]  forKey:kYNDHttpHeaderKey_PhoneType];
//    [headParameters ss_setObject:[utils getDeviceResolution] forKey:kYNDHttpHeaderKey_PhoneResolution];
//    [headParameters ss_setObject:[utils curNetworkStateName] forKey:kYNDHttpHeaderKey_Network];
//
//    //待定
//    [headParameters ss_setObject:[utils getAppCode]     forKey:kYNDHttpHeaderKey_AppCode];
//    [headParameters ss_setObject:[utils getAppType]     forKey:kYNDHttpHeaderKey_AppType];
//    [headParameters ss_setObject:[utils getLocationInfo] forKey:kYNDHttpHeaderKey_LatitudeLongitude];

    return headParameters;
}



@end
