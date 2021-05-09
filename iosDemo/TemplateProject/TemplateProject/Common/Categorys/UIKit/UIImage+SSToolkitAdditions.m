//
//  UIImage+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "UIImage+SSToolkitAdditions.h"

@implementation UIImage (SSToolkitAdditions)

//纯色图片
+ (UIImage *)ss_imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (UIImage *)ss_imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)ss_imageWithView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}



#pragma mark - 圆角

//返回圆角image, 圆角大小为短边的二分之一
- (UIImage *)ss_roundImage {
    
    CGSize size = self.size;
    CGFloat radius = MIN(size.width, size.height) / 2.0;
    return [self ss_roundImageWithSize:size radius:radius];
}

//返回指定圆角大小的圆角image
- (UIImage *)ss_roundImageWithSize:(CGSize)size radius:(CGFloat)radius {
    
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    
    //Core Graphic绘图
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:radius];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    [self drawInRect:frame];
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



#pragma mark - 图片缩放

//返回缩放比例
- (CGFloat)ss_scaleWithContainerSize:(CGSize)containerSize {
    
    //缩放比例，取宽，高缩放比例中的较小值
    CGSize imageSize = self.size;
    return MIN((containerSize.width / imageSize.width) , (containerSize.height / imageSize.height));
}

//返回缩放后的图片size
- (CGSize)ss_scaleSizeWithContainerSize:(CGSize)containerSize {
    
    //缩放比例，取宽，高缩放比例中的较小值
    CGFloat scale = (CGFloat)[self ss_scaleWithContainerSize:containerSize];
    return CGSizeMake(self.size.width * scale, self.size.height * scale);
}

//使用指定缩放比例对Image进行缩放
- (UIImage *)ss_scaleImageWithScale:(float)scale {
    
    CGSize resultImageSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIGraphicsBeginImageContext(resultImageSize);
    [self drawInRect:CGRectMake(0, 0, resultImageSize.width, resultImageSize.height)];
    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

//把Image缩放到指定容器size
- (UIImage *)ss_scaleImageWithContainerSize:(CGSize)containerSize {
    
    CGFloat scale = [self ss_scaleWithContainerSize:containerSize];
    return [self ss_scaleImageWithScale:scale];
}





#pragma mark - 裁剪Image某个区域

//裁剪image的某个区域
- (UIImage *)ss_croppedWithRect:(CGRect)rect {
    
    // CGImageCreateWithImageInRect's `rect` parameter is in pixels of the image's coordinates system. Convert from points.
    CGFloat scale = self.scale;
    rect = CGRectMake(rect.origin.x * scale, rect.origin.y * scale,
                      rect.size.width * scale, rect.size.height * scale);

    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef scale:scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return cropped;
}

//裁剪成正方形Image
- (UIImage *)ss_squareImage {
    
    CGSize imageSize = self.size;
    CGFloat shortestSide = fminf(imageSize.width, imageSize.height);
    return [self ss_croppedWithRect:CGRectMake(0.0f, 0.0f, shortestSide, shortestSide)];
}



#pragma mark - 非缓存图片

+ (UIImage *)ss_noCachedImageNamed:(NSString *)imageName {
    return [self ss_noCachedImageNamed:imageName SubBundleName:nil];
}

+ (UIImage *)ss_noCachedImageNamed:(NSString *)imageName SubBundleName:(NSString *)subBundleName {
    
    UIImage *image = nil;
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    if (subBundleName.length > 0) {
        bundlePath = [bundlePath stringByAppendingPathComponent:subBundleName];
    }
    
    NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}



#pragma mark - 截图

//截图，对指定View截图
+ (UIImage *)ss_captureView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//截图，对屏幕截图
+ (UIImage *)ss_captureScreen {
    
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    return [self ss_captureView:screenWindow];
}

//截图，对指定view的某个区域进行截图
+ (UIImage *)ss_captureView:(UIView *)view frame:(CGRect)frame {
    
    UIImage *tempImage = [self ss_captureView:view];
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(tempImage.CGImage, frame);
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return resultImage;
}








#pragma mark - 图片混合

//把两张图片混合到一张图片上
+ (UIImage *)ss_mergeWithImage1:(UIImage*)image1
                         frame1:(CGRect)frame1
                         image2:(UIImage *)image2
                         frame2:(CGRect)frame2
                     resultSize:(CGSize)resultSize {
    
    UIGraphicsBeginImageContext(resultSize);
    [image1 drawInRect:frame1 blendMode:kCGBlendModeLuminosity alpha:1.0];
    [image2 drawInRect:frame2 blendMode:kCGBlendModeLuminosity alpha:1.0];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 格式

//图片格式
+ (NSString *)ss_contentTypeForImageData:(NSData *)data {
    
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c)
    {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}



@end
