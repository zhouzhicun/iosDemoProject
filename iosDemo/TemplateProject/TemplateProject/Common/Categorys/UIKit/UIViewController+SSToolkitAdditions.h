//
//  UIViewController+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/6/12.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+SSToolkitAdditions.h"
#import "UILabel+SSToolkitAdditions.h"

typedef NS_ENUM(NSInteger, SSBarButtonItemType) {
    SSBarButtonItemTypeLeft,
    SSBarButtonItemTypeRight
};


@interface UIViewController (SSToolkitAdditions)


#pragma mark - Alert

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelActionTitle:(NSString *)cancelActionTitle
             okActionTitle:(NSString *)okActionTitle
              cancelAction:(void (^)(UIAlertAction *action))cancelAction
                  okAction:(void (^)(UIAlertAction *action))okAction;



#pragma mark - 添加childVC


/// Add a childVC to another controller, deals with the normal
/// View Controller containment methods.

- (void)ss_addChildViewController:(UIViewController *)controller atFrame:(CGRect)frame;

/// Allows you to add a childViewController inside a view in your hierarchy and will deal
/// the normal view controller containment methods.

- (void)ss_addChildViewController:(UIViewController *)controller inView:(UIView *)view atFrame:(CGRect)frame;


/// Remove a child View Controller and removes from superview
- (void)ss_removeChildViewController:(UIViewController *)controller;



#pragma mark - NavigationBarButtonItem

//设置导航栏标题
- (void)ss_addNavigationBarTitleAttrItem:(SSTextAttributedItem *)textItem;

//添加导航栏按钮
- (void)ss_addBarButtonWithTitle:(NSString *)title
                            font:(UIFont *)font
                     normalColor:(UIColor *)normalColor
                  highLightColor:(UIColor *)highLightColor
               barButtonItemType:(SSBarButtonItemType)barButtonItemType
                          offset:(CGFloat)offset
                    pressedBlock:(void (^)(UIButton *button))pressedBlock;

//添加导航栏定长按钮
- (void)ss_addBarButtonWithTitle:(NSString *)title
                            font:(UIFont *)font
                     normalColor:(UIColor *)normalColor
                  highLightColor:(UIColor *)highLightColor
               barButtonItemType:(SSBarButtonItemType)barButtonItemType
                 barButtonLength:(NSNumber *)barBtnLen
                          offset:(CGFloat)offset
                    pressedBlock:(void (^)(UIButton *button))pressedBlock;


//添加导航栏按钮
- (void)ss_addBarButtonWithNormalImageName:(NSString *)normalImage
                        highLightImageName:(NSString *)highLightImage
                         barButtonItemType:(SSBarButtonItemType)barButtonItemType
                                    offset:(CGFloat)offset
                              pressedBlock:(void (^)(UIButton *button))pressedBlock;

//添加导航栏按钮
- (void)ss_addBarButton:(UIButton *)button offset:(CGFloat)offset barButtonItemType:(SSBarButtonItemType)barButtonItemType;




@end
