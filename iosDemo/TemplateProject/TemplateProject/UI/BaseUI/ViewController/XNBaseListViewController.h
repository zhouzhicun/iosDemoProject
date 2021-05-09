//
//  XNBaseListViewController.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseViewController.h"
#import "XNBaseListViewModel.h"


/**
 *  所有列表页都继承此类，默认有下拉刷新，没有上拉加载更多
 *
 *  打开下拉刷新 self.hideHeaderRefresh = NO;
 *  打开上拉更多 self.hideFooterLoadMore = NO;
 */
@interface XNBaseListViewController : XNBaseViewController

/* tableView列表 */
@property (nonatomic, strong, readonly) UITableView *tableView;

/* 是否隐藏下拉刷新 */
@property (nonatomic, assign) BOOL hideHeaderRefresh;

/* 是否隐藏上拉加载更多 */
@property (nonatomic, assign) BOOL hideFooterLoadMore;

/**
 *  恢复列表状态，滚动到顶部，currentPage变回1，自动调用请求
 */
- (void)reloadData;

- (void)setupSubView NS_REQUIRES_SUPER;


@end


