//
//  XNLVerifyCodeButton.h
//  XNLoan
//
//  Created by xiaoniu on 16/8/22.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^XNLCountDownHandlerBlock)(void);

/**
 *  @brief 倒计时Button
 */
@interface XNLVerifyCodeButton : UIButton

/* 开始计时 */
@property(nonatomic, copy)XNLCountDownHandlerBlock countDownHandlerBlock;


/**
 *  设置样式
 *
 *  @param hasBorder 是否有边框
 */
- (void)setupStyleWithHasBorder:(BOOL)hasBorder;



/**
 *  开始倒计时
 */
- (void)startCountDown;


/**
 *  停止倒计时
 */
- (void)stopCountDown;

@end
