//
//  UIViewController+SSToolkitAdditions.m
//    
//
//  Created by fdd_zzc on 15/6/12.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import "UIViewController+SSToolkitAdditions.h"

#import "XNGlobalMacros.h"
#import <BlocksKit+UIKit.h>


@implementation UIViewController (SSToolkitAdditions)

#pragma mark - Alert

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelActionTitle:(NSString *)cancelActionTitle
             okActionTitle:(NSString *)okActionTitle
              cancelAction:(void (^)(UIAlertAction *action))cancelAction
                  okAction:(void (^)(UIAlertAction *action))okAction {
    
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:title
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    if (cancelActionTitle) {
        UIAlertAction *cancel =
        [UIAlertAction actionWithTitle:cancelActionTitle
                                 style:UIAlertActionStyleCancel
                               handler:cancelAction];
        [alertController addAction:cancel];
    }
    
    if (okActionTitle) {
        UIAlertAction *ok =
        [UIAlertAction actionWithTitle:okActionTitle
                                 style:UIAlertActionStyleDefault
                               handler:okAction];
        [alertController addAction:ok];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alertController animated:YES completion:nil];
    });
}



#pragma mark - childViewController

- (void)ss_addChildViewController:(UIViewController *)controller atFrame:(CGRect)frame {
    [self ss_addChildViewController:controller inView:self.view atFrame:frame];
}

- (void)ss_addChildViewController:(UIViewController *)controller inView:(UIView *)view atFrame:(CGRect)frame {
    [controller willMoveToParentViewController:self];
    [self addChildViewController:controller];
    
    controller.view.frame = frame;
    [view addSubview:controller.view];
    
    [controller didMoveToParentViewController:self];
}

- (void)ss_removeChildViewController:(UIViewController *)controller {
    [controller willMoveToParentViewController:nil];
    [controller removeFromParentViewController];
    [controller.view removeFromSuperview];
}


#pragma mark - NavigationBarButtonItem

//导航栏标题
- (void)ss_addNavigationBarTitleAttrItem:(SSTextAttributedItem *)textItem {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    [titleLabel ss_setText:textItem];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    
}



//导航栏按钮
- (void)ss_addBarButtonWithTitle:(NSString *)title
                            font:(UIFont *)font
                     normalColor:(UIColor *)normalColor
                  highLightColor:(UIColor *)highLightColor
               barButtonItemType:(SSBarButtonItemType)barButtonItemType
                          offset:(CGFloat)offset
                    pressedBlock:(void (^)(UIButton *button))pressedBlock {
    
    
   [self ss_addBarButtonWithTitle:title font:font
                      normalColor:normalColor highLightColor:highLightColor
                barButtonItemType:barButtonItemType
                  barButtonLength:nil
                           offset:offset
                     pressedBlock:pressedBlock];
    
}

//导航栏按钮
- (void)ss_addBarButtonWithTitle:(NSString *)title
                            font:(UIFont *)font
                     normalColor:(UIColor *)normalColor
                  highLightColor:(UIColor *)highLightColor
               barButtonItemType:(SSBarButtonItemType)barButtonItemType
                 barButtonLength:(NSNumber *)barBtnLen
                          offset:(CGFloat)offset
                    pressedBlock:(void (^)(UIButton *button))pressedBlock {
    
    
    CGSize size = [UILabel ss_suggestSizeForString:title Font:font width:CGFLOAT_MAX];
    CGRect frame = CGRectZero;
    frame.size = size;
    
    if (barBtnLen) {
        frame.size.width = [barBtnLen floatValue];
    }
    
    UIButton *button = createViewWithFrame(UIButton, frame);
    SSTextAttributedItem *textItem = SSTextAttrItem(title, font, normalColor);
    [button ss_setTitle:textItem forState:UIControlStateNormal];
    textItem.color = highLightColor;
    [button ss_setTitle:textItem forState:UIControlStateHighlighted];
    
    //事件处理
    [button bk_addEventHandler:^(id sender) {
        
        if (pressedBlock) {
            pressedBlock(sender);
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    [self ss_addBarButton:button offset:offset barButtonItemType:barButtonItemType];
    
}



//导航栏按钮
- (void)ss_addBarButtonWithNormalImageName:(NSString *)normalImage
                        highLightImageName:(NSString *)highLightImage
                         barButtonItemType:(SSBarButtonItemType)barButtonItemType
                                    offset:(CGFloat)offset
                              pressedBlock:(void (^)(UIButton *button))pressedBlock {
    
    UIButton *button = createView(UIButton);
    button.frame = CGRectMake(0, 0, 40, 36);
    [button ss_setImage:SSImageAttrItemWithName(normalImage, highLightImage, nil, nil)];

    //事件处理
    [button bk_addEventHandler:^(id sender) {
        
        if (pressedBlock) {
            pressedBlock(sender);
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    [self ss_addBarButton:button offset:offset barButtonItemType:barButtonItemType];
}


- (void)ss_addBarButton:(UIButton *)button offset:(CGFloat)offset barButtonItemType:(SSBarButtonItemType)barButtonItemType {

    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *negativeSpaceBarButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                   target:nil action:nil];
    //固定间距
    negativeSpaceBarButtonItem.width = -(16 - offset);
    
    NSArray *barItems = @[negativeSpaceBarButtonItem, buttonItem];
    switch (barButtonItemType) {
        case SSBarButtonItemTypeLeft: {
            
            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
            self.navigationItem.leftBarButtonItems = barItems;
            break;
        }
        case SSBarButtonItemTypeRight: {
            
            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            self.navigationItem.rightBarButtonItems = barItems;
            break;
        }
    }
}





@end
