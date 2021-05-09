//
//  XNDeviceInfoModel.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNBaseModel.h"


/*
 * ref: https://www.innerfence.com/howto/apple-ios-devices-dates-versions-instruction-sets
 *
 * 首先将上述网页的设备列表信息处理成json文件，然后内置到App本地, 再解析json文件得到各类机型信息数组
 */

NS_ASSUME_NONNULL_BEGIN

@interface XNDeviceModel : XNBaseModel

/** 设备名称 */
@property (nonatomic, copy) NSString *name;
/** 设备模型 */
@property (nonatomic, copy) NSString *model;
/** 发布日期 */
@property (nonatomic, copy) NSString *released;
/** 网络连接方式 */
@property (nonatomic, copy) NSString *connector;
/** 固件版本 */
@property (nonatomic, copy) NSString *firmware;
/** 芯片版本 */
@property (nonatomic, copy) NSString *arm;
/** 像素 */
@property (nonatomic, copy) NSString *pixels;
/** 矩阵点 */
@property (nonatomic, copy) NSString *points;
/** 图片比例 */
@property (nonatomic, copy) NSString *scale;
/** 尺寸 */
@property (nonatomic, copy) NSString *inches;


@end

NS_ASSUME_NONNULL_END
