//
//  YNDResponseParamsConstants.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "YNDResponseParamsConstants.h"

#pragma mark - response参数
//response字段
NSString *const kYNDRespCodeKey       = @"code";
NSString *const kYNDRespDataKey       = @"data";
NSString *const kYNDRespMessageKey    = @"msg";


#pragma mark - response错误码
NSString *const kYNDResponseCode_Success         = @"0";              //业务正常
NSString *const kYNDResponseCode_UploadSuccess   = @"200";            //上传成功
NSString *const kYNDResponseCode_InvildToken     = @"10008";          //token失效
