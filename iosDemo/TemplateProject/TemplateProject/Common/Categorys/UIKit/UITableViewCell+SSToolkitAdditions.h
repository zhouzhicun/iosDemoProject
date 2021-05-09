//
//  UITableViewCell+SSToolkitAdditions.h
//  
//
//  Created by xiaoniu on 16/6/17.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SSToolkitAdditions)

+ (NSString *)ss_cellIdentifier;

/**
 *  设置分割线的边距
 *
 *  @param edgeInset 分割线上下左右边距
 *  1 如果需要分割线宽度等于屏幕宽度(在ios7及以上系统上分割线左侧默认15像素的空白),只需传入UIEdgeInsetsZero即可。
 *  2 如果需要自定义分割线左右两侧的空白宽度，比如左边10，右边30. 
 *  则只需设置edgeInset的 left = 10， right = 30. 其余为0，例如 UIEdgeInsetsMake(0, 10, 0, 30)
 */

- (void)ss_setSeparatorInset:(UIEdgeInsets)edgeInset;

@end
