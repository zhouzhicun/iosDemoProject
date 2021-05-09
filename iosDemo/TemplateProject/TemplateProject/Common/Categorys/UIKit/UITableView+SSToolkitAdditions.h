//
//  UITableView+SSToolkitAdditions.h
//    
//
//  Created by fdd_zzc on 15/4/28.
//  Copyright (c) 2015年 fdd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SSToolkitAdditions)


//设置数据源和委托
- (void)ss_setDataSourceDelegate:(id<UITableViewDataSource,UITableViewDelegate>)dataSourceDelegate;

//隐藏多余的空cell
- (void)ss_hideEmptyCell;


//获取view所在的cell的indexPath
- (NSIndexPath *)ss_indexPathForRowContainingView:(UIView *)view;





#pragma mark - 设置分隔线

//隐藏分隔线
- (void)ss_hideSeparatorLine;

//设置分割线颜色+样式
- (void)ss_setSeparatorColor:(UIColor *)color Style:(UITableViewCellSeparatorStyle)style;


/**
 *  设置分割线的边距(该方法要和cell的该方法同时使用)
 *
 *  @param edgeInset 分割线上下左右边距
 *  1 如果需要分割线宽度等于屏幕宽度(在ios7及以上系统上分割线左侧默认15像素的空白),只需传入UIEdgeInsetsZero即可。
 *  2 如果需要自定义分割线左右两侧的空白宽度，比如左边10，右边30.
 *  则只需设置edgeInset的 left = 10， right = 30. 其余为0，例如 UIEdgeInsetsMake(0, 10, 0, 30)
 */
- (void)ss_setSeparatorInset:(UIEdgeInsets)edgeInset;


#pragma mark - cell


- (void)ss_updateWithBlock:(void (^)(UITableView *tableView))block;

- (void)ss_scrollToRow:(NSUInteger)row
             inSection:(NSUInteger)section
      atScrollPosition:(UITableViewScrollPosition)scrollPosition
              animated:(BOOL)animated;


#pragma mark - row(插入，删除，reload)

- (void)ss_insertRowAtIndexPath:(NSIndexPath *)indexPath
               withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_insertRow:(NSUInteger)row
           inSection:(NSUInteger)section
    withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_reloadRowAtIndexPath:(NSIndexPath *)indexPath
               withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_reloadRow:(NSUInteger)row
           inSection:(NSUInteger)section
    withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_deleteRowAtIndexPath:(NSIndexPath *)indexPath
               withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_deleteRow:(NSUInteger)row
           inSection:(NSUInteger)section
    withRowAnimation:(UITableViewRowAnimation)animation;


#pragma mark - section(插入，删除，reload)

- (void)ss_insertSection:(NSUInteger)section
        withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_deleteSection:(NSUInteger)section
        withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_reloadSection:(NSUInteger)section
        withRowAnimation:(UITableViewRowAnimation)animation;

- (void)ss_clearSelectedRowsAnimated:(BOOL)animated;


@end
