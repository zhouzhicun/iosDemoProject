//
//  XNLCommonButton.h
//  XNLoan
//
//  Created by xiaoniu on 16/7/4.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLCommonButton.h"

@interface XNLBaseButton : XNLCommonButton

//title和image之间的间距: float类型
@property (nonatomic, copy) NSNumber *space;

//子视图对齐方式
@property (nonatomic, assign) XNLButtonSubViewAlignType alignType;

@end
