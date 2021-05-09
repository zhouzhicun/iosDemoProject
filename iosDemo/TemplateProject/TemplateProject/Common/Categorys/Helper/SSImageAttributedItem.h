//
//  SSImageAttributedItem.h
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


#pragma mark - 图片


typedef NS_ENUM(NSUInteger, SSImageAttributedItemType) {
    SSImageAttributedItemType_Name,
    SSImageAttributedItemType_Image,
};

#define SSImageAttrItemWithName(normalName, highName, selectedName, disableName) \
[SSImageAttributedItem nameItemWithNormal:(normalName) High:(highName) Selected:(selectedName) Disable:(disableName)]

#define SSImageAttrItemWithImage(normalImage, highImage, selectedImage, disableImage) \
[SSImageAttributedItem imageItemWithNormal:(normalImage) High:(highImage) Selected:(selectedImage) Disable:(disableImage)]


@interface SSImageAttributedItem : NSObject

/* item对象类型 */
@property (nonatomic, assign) SSImageAttributedItemType  itemType;

//文件名
@property (nonatomic, copy) NSString *normalName;       /* normal */
@property (nonatomic, copy) NSString *highLightName;    /* 高亮 */
@property (nonatomic, copy) NSString *selectedName;     /* 选中 */
@property (nonatomic, copy) NSString *disableName;      /* 禁用 */

//image
@property (nonatomic, strong) UIImage *normalImage;       /* normal */
@property (nonatomic, strong) UIImage *highLightImage;    /* 高亮 */
@property (nonatomic, strong) UIImage *selectedImage;     /* 选中 */
@property (nonatomic, strong) UIImage *disableImage;      /* 禁用 */


+ (instancetype)nameItemWithNormal:(NSString *)normal
                              High:(NSString *)high
                          Selected:(NSString *)selected
                           Disable:(NSString *)disable;

+ (instancetype)imageItemWithNormal:(UIImage *)normal
                               High:(UIImage *)high
                           Selected:(UIImage *)selected
                            Disable:(UIImage *)disable;

@end
