//
//  UIButton+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/11/3.
//  Copyright © 2015年 fdd. All rights reserved.
//

#import "UIButton+SSToolkitAdditions.h"

@implementation UIButton (SSToolkitAdditions)



- (void)ss_setTitle:(NSString *)title
          TitleFont:(UIFont  *)font
   NormalTitleColor:(UIColor *)normalTitleColor
HighLightTitleColor:(UIColor *)highLightTitleColor {
    
    
    [self setTitle:title forState:UIControlStateNormal];
    
    if (font != nil) {
        [self.titleLabel setFont:font];
    }
    
    if (normalTitleColor != nil) {
        [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
    }
    
    if (highLightTitleColor != nil) {
        [self setTitleColor:highLightTitleColor forState:UIControlStateHighlighted];
    }
    
}


- (void)ss_setTitle:(NSString *)title
          TitleFont:(UIFont  *)font
   NormalTitleColor:(UIColor *)normalTitleColor
 SelectedTitleColor:(UIColor *)selectedTitleColor {
    
    
    [self setTitle:title forState:UIControlStateNormal];
    
    if (font != nil) {
        [self.titleLabel setFont:font];
    }
    
    if (normalTitleColor != nil) {
        [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
    }
    
    if (selectedTitleColor != nil) {
        [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    }
    
}


#pragma mark - 设置图标

- (void)ss_setNormalImage:(UIImage *)normalImage
           HighlightImage:(UIImage *)clickIamge {
    
    if (normalImage != nil) {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (clickIamge != nil) {
        [self setImage:clickIamge forState:UIControlStateHighlighted];
    }
}



- (void)ss_setNormalImage:(UIImage *)normalImage
            SelectedImage:(UIImage *)selectedImage {
    
    if (normalImage != nil) {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    
    
    if (selectedImage != nil) {
        [self setImage:selectedImage forState:UIControlStateHighlighted];
        [self setImage:selectedImage forState:UIControlStateSelected];
    }
}


#pragma mark - 设置背景图

- (void)ss_setNormalBGImage:(UIImage *)normalBGImage
           HighlightBGImage:(UIImage *)clickBGIamge {
    
    if (normalBGImage != nil) {
        [self setBackgroundImage:normalBGImage forState:UIControlStateNormal];
    }
    
    if (clickBGIamge != nil) {
        [self setBackgroundImage:clickBGIamge forState:UIControlStateHighlighted];
    }
}




- (void)ss_setNormalBGImage:(UIImage *)normalBGImage
            SelectedBGImage:(UIImage *)selectedBGIamge {
    
    if (normalBGImage != nil) {
        [self setBackgroundImage:normalBGImage forState:UIControlStateNormal];
    }
    
    if (selectedBGIamge != nil) {
        [self setBackgroundImage:selectedBGIamge forState:UIControlStateSelected];
    }
}



#pragma mark - 设置Title

- (void)ss_setTitle:(SSTextAttributedItem *)textItem forState:(UIControlState)state {
    
    if (textItem.font) {
        [self.titleLabel setFont:textItem.font];
    }
    
    if (textItem.text) {
        [self setTitle:textItem.text forState:state];
    }
    
    if (textItem.color) {
        [self setTitleColor:textItem.color forState:state];
    }
}

#pragma mark - 设置Icon

- (void)ss_setImage:(SSImageAttributedItem *)imageItem {
    
    if (!imageItem) {
        return;
    }
    
    switch (imageItem.itemType) {
        case SSImageAttributedItemType_Name: {
            
            //文件名
            if (imageItem.normalName) {
                [self setImage:[UIImage imageNamed:imageItem.normalName] forState:UIControlStateNormal];
            }
            
            if (imageItem.highLightName) {
                [self setImage:[UIImage imageNamed:imageItem.highLightName] forState:UIControlStateHighlighted];
            }
            
            if (imageItem.selectedName) {
                [self setImage:[UIImage imageNamed:imageItem.selectedName] forState:UIControlStateSelected];
            }
            
            if (imageItem.disableName) {
                [self setImage:[UIImage imageNamed:imageItem.disableName] forState:UIControlStateDisabled];
            }
            break;
        }
        case SSImageAttributedItemType_Image: {
            
            
            //图片Image
            if (imageItem.normalImage) {
                [self setImage:imageItem.normalImage forState:UIControlStateNormal];
            }
            
            if (imageItem.highLightImage) {
                [self setImage:imageItem.highLightImage forState:UIControlStateHighlighted];
            }
            
            if (imageItem.selectedImage) {
                [self setImage:imageItem.selectedImage forState:UIControlStateSelected];
            }
            
            if (imageItem.disableImage) {
                [self setImage:imageItem.disableImage forState:UIControlStateDisabled];
            }
            
            break;
        }
    }
}


#pragma mark - 设置背景图

- (void)ss_setBackground:(SSImageAttributedItem *)imageItem {
    
    if (!imageItem) {
        return;
    }
    
    switch (imageItem.itemType) {
        case SSImageAttributedItemType_Name: {
            
            //文件名
            if (imageItem.normalName) {
                [self setBackgroundImage:[UIImage imageNamed:imageItem.normalName] forState:UIControlStateNormal];
            }
            
            if (imageItem.highLightName) {
                [self setBackgroundImage:[UIImage imageNamed:imageItem.highLightName] forState:UIControlStateHighlighted];
            }
            
            if (imageItem.selectedName) {
                [self setBackgroundImage:[UIImage imageNamed:imageItem.selectedName] forState:UIControlStateSelected];
            }
            
            if (imageItem.disableName) {
                [self setBackgroundImage:[UIImage imageNamed:imageItem.disableName] forState:UIControlStateDisabled];
            }
            break;
        }
        case SSImageAttributedItemType_Image: {

            //图片Image
            if (imageItem.normalImage) {
                [self setBackgroundImage:imageItem.normalImage forState:UIControlStateNormal];
            }
            
            if (imageItem.highLightImage) {
                [self setBackgroundImage:imageItem.highLightImage forState:UIControlStateHighlighted];
            }
            
            if (imageItem.selectedImage) {
                [self setBackgroundImage:imageItem.selectedImage forState:UIControlStateSelected];
            }
            
            if (imageItem.disableImage) {
                [self setBackgroundImage:imageItem.disableImage forState:UIControlStateDisabled];
            }
            
            break;
        }
    }
}



@end
