//
//  UIImage+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SSToolkitAdditions)


//根据颜色生成图片
+ (UIImage *)ss_imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)ss_imageWithColor:(UIColor *)color;
+ (UIImage *)ss_imageWithView:(UIView *)view;



#pragma mark - 圆角

//返回圆角image, 圆角大小为短边的二分之一
- (UIImage *)ss_roundImage;

//返回指定圆角大小的圆角image
- (UIImage *)ss_roundImageWithSize:(CGSize)size radius:(CGFloat)radius;


#pragma mark - 图片缩放

//返回缩放比例
- (CGFloat)ss_scaleWithContainerSize:(CGSize)containerSize;

//返回缩放后的图片size
- (CGSize)ss_scaleSizeWithContainerSize:(CGSize)containerSize;

//使用指定缩放比例对Image进行缩放
- (UIImage *)ss_scaleImageWithScale:(float)scale;

//把Image缩放到指定容器size
- (UIImage *)ss_scaleImageWithContainerSize:(CGSize)containerSize;



#pragma mark - 裁剪Image某个区域

//裁剪image的某个区域
- (UIImage *)ss_croppedWithRect:(CGRect)rect;

//裁剪成正方形Image
- (UIImage *)ss_squareImage;


#pragma mark - 非缓存图片

+ (UIImage *)ss_noCachedImageNamed:(NSString *)imageName;

+ (UIImage *)ss_noCachedImageNamed:(NSString *)imageName SubBundleName:(NSString *)subBundleName;


#pragma mark - 截图

//截图，对指定View截图
+ (UIImage *)ss_captureView:(UIView *)view;

//截图，对屏幕截图
+ (UIImage *)ss_captureScreen;

//截图，对指定view的某个区域进行截图
+ (UIImage *)ss_captureView:(UIView *)view frame:(CGRect)frame;




#pragma mark - 图片混合

//把两张图片混合到一张图片上
+ (UIImage *)ss_mergeWithImage1:(UIImage*)image1
                         frame1:(CGRect)frame1
                         image2:(UIImage *)image2
                         frame2:(CGRect)frame2
                     resultSize:(CGSize)resultSize;

#pragma mark - 格式

//图片格式
+ (NSString *)ss_contentTypeForImageData:(NSData *)data;
    

@end
