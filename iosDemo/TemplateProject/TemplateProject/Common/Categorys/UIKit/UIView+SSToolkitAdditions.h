//
//  UIView+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSAttributedItemCollection.h"


@interface UIView (SSToolkitAdditions)


#pragma mark - 约束布局相关

//设置约束优先级
- (void)ss_setContentHuggingPriority;

//计算view的最小size(约束布局)，主要用于获取约束布局的CustomView的高度
- (CGSize)ss_calculateCompressedSize;



#pragma mark - 边框圆角

//设置圆角，会导致离屏渲染
- (void)ss_setCornerRadius:(CGFloat)radius;

//设置任意角圆角，会导致离屏渲染
- (void)ss_setCornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)corners;

//设置边框
- (void)ss_setBorderWidth:(CGFloat)width borderColor:(UIColor *)color;

//设置 边框 + 圆角(优先使用)
- (void)ss_setBorder:(SSBorderAttributedItem *)attrItem;

//像素点的颜色
- (UIColor *)ss_colorAtPixel:(CGPoint)point;


#pragma mark - 截图

- (UIImage *)ss_snapshotImage;

- (UIImage *)ss_snapshotImageWithFrame:(CGRect)frame;

- (NSData *)ss_snapshotPDF;



#pragma mark - 显示，隐藏

- (void)ss_show;            //显示
- (void)ss_hide;            //隐藏
- (void)ss_fadeIn;          //淡入
- (void)ss_fadeOut;         //淡出
- (void)ss_fadeOutAndRemoveFromSuperview; //淡出并从父view中移除



#pragma mark - 开始，结束，暂停，恢复

- (void)ss_startRotationAnimatingWithDuration:(CGFloat)duration;                   //开始旋转动画
- (void)ss_stopRotationAnimating;                                                  //停止旋转动画
- (void)ss_pauseAnimating;                                                         //暂停动画
- (void)ss_resumeAnimating;                                                        //恢复动画




#pragma mark - 特效动画
+ (void)ss_animationReveal:(UIView *)view direction:(NSString *)direction;         //揭开
+ (void)ss_animationFade:(UIView *)view;                                           //渐隐渐消
+ (void)ss_animationFlip:(UIView *)view direction:(NSString *)direction;           //翻转
+ (void)ss_animationRotateAndScaleEffects:(UIView *)view;                          //各种旋转缩放效果
+ (void)ss_animationRotateAndScaleDownUp:(UIView *)view;                           //旋转同时缩小放大效果
+ (void)ss_animationPush:(UIView *)view direction:(NSString *)direction;           //push
+ (void)ss_animationCurl:(UIView *)view direction:(NSString *)direction;           //Curl
+ (void)ss_animationUnCurl:(UIView *)view direction:(NSString *)direction;         //UnCurl
+ (void)ss_animationMove:(UIView *)view direction:(NSString *)direction;           //Move
+ (void)ss_animationCube:(UIView *)view direction:(NSString *)direction;           //立方体
+ (void)ss_animationRippleEffect:(UIView *)view;                                   //水波纹
+ (void)ss_animationCameraEffect:(UIView *)view type:(NSString *)type;             //相机开合
+ (void)ss_animationSuckEffect:(UIView *)view;                                     //吸收
+ (void)ss_animationBounceOut:(UIView *)view;
+ (void)ss_animationBounceIn:(UIView *)view;
+ (void)ss_animationBounce:(UIView *)view;


@end
