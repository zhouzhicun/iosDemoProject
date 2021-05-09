//
//  XNParamsConstants.h
//  
//
//  Created by xiaoniu on 16/8/11.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - http固定header参数
extern NSString *const kYNDHttpHeaderKey_UserAgent;
extern NSString *const kYNDHttpHeaderKey_Charset;
extern NSString *const kYNDHttpHeaderKey_ContentType;
extern NSString *const kYNDHttpHeaderKey_ContentEncoding;
extern NSString *const kYNDHttpHeaderKey_AcceptEncoding;


#pragma mark - Http自定义Header参数
extern NSString *const kYNDHttpHeaderKey_Token;                    //token
extern NSString *const kYNDHttpHeaderKey_Channel;                  //渠道
extern NSString *const kYNDHttpHeaderKey_ChannelId;                //渠道ID
extern NSString *const kYNDHttpHeaderKey_Version;                  //App版本

extern NSString * const kYNDHttpHeaderKey_IsAutoLogin;
extern NSString * const kYNDHttpHeaderKey_AutoToken;

extern NSString *const kYNDHttpHeaderKey_DeviceId;                 //设备UUID
extern NSString *const kYNDHttpHeaderKey_OSType;                   //系统类型:"IOS"

extern NSString *const kYNDHttpHeaderKey_AppCode;                  //可配，配置文件AppCodeMacro.h
extern NSString *const kYNDHttpHeaderKey_AppType;                  //ios,android,h5
extern NSString *const kYNDHttpHeaderKey_IDFA;                     //idfa
extern NSString *const kYNDHttpHeaderKey_PhoneType;                //设备类型
extern NSString *const kYNDHttpHeaderKey_PhoneResolution;          //设备分辨率
extern NSString *const kYNDHttpHeaderKey_Network;                  //网络类型
extern NSString *const kYNDHttpHeaderKey_LatitudeLongitude;        //经纬度




#pragma mark - Http Body参数
extern NSString *const kYNDHttpRequestKey_UploadFile_files;
extern NSString *const kYNDHttpResponseKey_UploadFile_fileIds;




