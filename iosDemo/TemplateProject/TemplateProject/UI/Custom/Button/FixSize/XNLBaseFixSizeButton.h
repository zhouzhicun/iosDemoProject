//
//  XNLCommonButton.h
//  XNLoan
//
//  Created by xiaoniu on 16/7/4.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLCommonButton.h"

@interface XNLBaseFixSizeButton : XNLCommonButton

//间距 + 边距
@property (nonatomic, copy) NSNumber *space;
@property (nonatomic, copy) NSNumber *padding;

//子视图对齐方式
@property (nonatomic, assign) XNLButtonSubViewAlignType alignType;

//内容整体布局类型
@property (nonatomic, assign) XNLButtonContentLayoutType contentLayoutType;

//居中对齐
- (void)centerLayout;

//线性左布局
- (void)linearLeadingLayout;

//线性右布局
- (void)linearTailLayout;


@end
