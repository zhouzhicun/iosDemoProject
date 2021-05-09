//
//  YNDRequestParamsConstants.m
//  
//
//  Created by xiaoniu on 16/8/11.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "YNDRequestParamsConstants.h"

#pragma mark - http固定header参数
NSString *const kYNDHttpHeaderKey_UserAgent         = @"User-Agent";
NSString *const kYNDHttpHeaderKey_Charset           = @"Charset";
NSString *const kYNDHttpHeaderKey_ContentType       = @"Content-Type";
NSString *const kYNDHttpHeaderKey_ContentEncoding   = @"Content-Encoding";
NSString *const kYNDHttpHeaderKey_AcceptEncoding    = @"Accept-Encoding";


#pragma mark - Http Header参数

NSString *const kYNDHttpHeaderKey_Token             = @"token";
NSString *const kYNDHttpHeaderKey_Channel           = @"channel";
NSString *const kYNDHttpHeaderKey_Version           = @"version";
NSString *const kYNDHttpHeaderKey_ChannelId         = @"channelId";


NSString * const kYNDHttpHeaderKey_IsAutoLogin      = @"isAutoLogin";
NSString * const kYNDHttpHeaderKey_AutoToken        = @"autoToken";


NSString *const kYNDHttpHeaderKey_DeviceId          = @"deviceId";
NSString *const kYNDHttpHeaderKey_OSType            = @"osType";

NSString *const kYNDHttpHeaderKey_AppCode           = @"appCode";
NSString *const kYNDHttpHeaderKey_AppType           = @"appType";
NSString *const kYNDHttpHeaderKey_IDFA              = @"idfa";
NSString *const kYNDHttpHeaderKey_PhoneType         = @"phoneType";
NSString *const kYNDHttpHeaderKey_PhoneResolution   = @"phoneResolution";
NSString *const kYNDHttpHeaderKey_Network           = @"network";
NSString *const kYNDHttpHeaderKey_LatitudeLongitude = @"latitudeLongitude";


#pragma mark - Http Body参数

//上传文件
NSString *const kYNDHttpRequestKey_UploadFile_files        = @"files";
NSString *const kYNDHttpResponseKey_UploadFile_fileIds     = @"fileIds";





