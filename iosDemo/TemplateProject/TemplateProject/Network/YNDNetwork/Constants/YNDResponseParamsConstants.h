//
//  YNDResponseParamsConstants.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - response参数
//response字段
extern NSString *const kYNDRespCodeKey;
extern NSString *const kYNDRespDataKey;
extern NSString *const kYNDRespMessageKey;



#pragma mark - response错误码
extern NSString *const kYNDResponseCode_Success;                     //业务正常
extern NSString *const kYNDResponseCode_UploadSuccess;               //上传成功
extern NSString *const kYNDResponseCode_InvildToken;                 //token失效
