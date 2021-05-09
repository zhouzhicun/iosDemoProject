//
//  UIButton+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/11/3.
//  Copyright © 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSAttributedItemCollection.h"


@interface UIButton (SSToolkitAdditions)


- (void)ss_setTitle:(NSString *)title
          TitleFont:(UIFont  *)font
   NormalTitleColor:(UIColor *)normalTitleColor
HighLightTitleColor:(UIColor *)highLightTitleColor;


- (void)ss_setTitle:(NSString *)title
          TitleFont:(UIFont  *)font
   NormalTitleColor:(UIColor *)normalTitleColor
 SelectedTitleColor:(UIColor *)selectedTitleColor;


#pragma mark - 设置图标

- (void)ss_setNormalImage:(UIImage *)normalImage
           HighlightImage:(UIImage *)clickIamge;

- (void)ss_setNormalImage:(UIImage *)normalImage
            SelectedImage:(UIImage *)selectedImage;

#pragma mark - 设置背景图
- (void)ss_setNormalBGImage:(UIImage *)normalBGImage
           HighlightBGImage:(UIImage *)clickBGIamge;

- (void)ss_setNormalBGImage:(UIImage *)normalBGImage
            SelectedBGImage:(UIImage *)selectedBGIamge;


#pragma mark - 设置Title

- (void)ss_setTitle:(SSTextAttributedItem *)textItem forState:(UIControlState)state;

#pragma mark - 设置Icon

- (void)ss_setImage:(SSImageAttributedItem *)imageItem;

#pragma mark - 设置背景图

- (void)ss_setBackground:(SSImageAttributedItem *)imageItem;

@end
