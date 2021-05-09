//
//  XNLInputView.h
//  XNLoan
//
//  Created by xiaoniu on 16/7/22.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XNLInputFormatTextField.h"
#import "XNLTextFieldSideView.h"

@interface XNLInputView : UIView <XNLTextFieldProtocol>

@property(nonatomic, strong, readonly)XNLInputFormatTextField *textField;

/* 只调用一次 */
- (void)setupConstraint;

@end
