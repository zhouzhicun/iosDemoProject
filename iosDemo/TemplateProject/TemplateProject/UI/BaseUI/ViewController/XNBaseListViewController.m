//
//  XNBaseListViewController.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseListViewController.h"
#import "XNGlobalMacros.h"
#import "UITableView+SSToolkitAdditions.h"
#import <Masonry/Masonry.h>

@interface XNBaseListViewController ()

/* tableView列表 */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XNBaseListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //默认初始化,隐藏下拉刷新和加载更多
    self.hideHeaderRefresh  = YES;
    self.hideFooterLoadMore = YES;
    
    XNBaseListViewModel *vm = (XNBaseListViewModel *)self.viewModel;
    switch (vm.listType) {
        case XNLListViewType_Normal:
        {
            //nothing
            break;
        }
        case XNLListViewType_Refresh:
        {
            //显示下拉刷新
            self.hideHeaderRefresh = NO;
            break;
        }
        case XNLListViewType_Paged:
        {
            //显示下拉刷新+加载更多
            self.hideHeaderRefresh  = NO;
            self.hideFooterLoadMore = NO;
            break;
        }

    }
}


#pragma mark - UI方法

- (void)setupSubView {
    [super setupSubView];
    
    //1.创建tableview
    [self createTableView];
    
    //2.配置下拉刷新，加载更多
    [self setupMJRefresh];
}

- (void)createTableView {
    
    //创建tableView
    self.tableView = createView(UITableView);
    [self.view addSubview:self.tableView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    //设置delegate
    [self.tableView ss_setDataSourceDelegate:(id<UITableViewDataSource, UITableViewDelegate>)self];
    
    //隐藏空cell, 并设置背景色
    [self.tableView ss_hideEmptyCell];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    @weakify(self);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - 配置MJ

- (void)setupMJRefresh {
    
    @weakify(self);
    
    //header
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //下拉刷新
        @strongify(self);
        [self requestHandlerWithRefresh:YES];
    }];
    
    header.stateLabel.hidden = YES;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.arrowView.image = [UIImage imageNamed:@"global_Refresh_down"];
    header.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    header.automaticallyChangeAlpha = YES;
    
    UIActivityIndicatorView *activity = [header valueForKey:@"loadingView"];
    activity.color = HEXCOLOR(0x506FEE);
    
    //footer
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        //加载更多
        @strongify(self);
        [self requestHandlerWithRefresh:NO];
    }];
    
    //    self.tableView.mj_header.updatedTimeHidden = YES;
    //    [self.tableView.header setTitle:kTableViewRefreshTextHeaderIdle forState:MJRefreshHeaderStateIdle];
    //    [self.tableView.header setTitle:kTableViewRefreshTextHeaderPulling forState:MJRefreshHeaderStatePulling];
    //    [self.tableView.header setTitle:kTableViewRefreshTextHeaderRefreshing forState:MJRefreshHeaderStateRefreshing];
    //    [self.tableView.header setTextColor:kTitleTextColor];
    //    [self.tableView.header setFont:[UIFont systemFontOfSize:13.0f]];
    //    [self.tableView.footer setTitle:kTableViewRefreshTextFooterRefreshing forState:MJRefreshFooterStateRefreshing];
    //    [self.tableView.footer setTextColor:kTitleTextColor];
    //    [self.tableView.footer setFont:[UIFont systemFontOfSize:13.0f]];
    
    self.tableView.mj_header = header;
    self.tableView.mj_footer = footer;
    
    self.tableView.mj_header.hidden = NO;
    self.tableView.mj_footer.hidden = YES;
}



#pragma mark - 绑定

//新增下拉刷新，加载更多的UI绑定
- (void)bindUISubject
{
    [super bindUISubject];
    
    XNBaseListViewModel *viewModel = (XNBaseListViewModel *)self.viewModel;
    
    @weakify(self);
    [[viewModel.endRefreshSignal deliverOnMainThread] subscribeNext:^(id x) {
        
        //停止下拉刷新动画
        @strongify(self);
        [self endRefreshing];
    }];
    
    [[viewModel.endLoadMoreSignal deliverOnMainThread] subscribeNext:^(id x) {
        
        //停止加载更多动画
        @strongify(self);
        [self endLoadMore];
    }];
    
    [[viewModel.hideLoadMoreSignal deliverOnMainThread] subscribeNext:^(NSNumber *hidden) {
        
        //是否隐藏LoadMore
        @strongify(self);
        self.hideFooterLoadMore = hidden.boolValue;
    }];
}


//默认实现：列表页请求成功默认刷新table
- (void)dispatchSuccessWithEvent:(NSString *)event data:(id)data
{
    //请求成功
    [self.tableView reloadData];
}




#pragma mark - Public Methods

#pragma mark -- 请求
- (void)requestHandlerWithRefresh:(BOOL)isRefresh {
    
    XNBaseListViewModel *viewModel = (XNBaseListViewModel *)self.viewModel;
    [viewModel fetchDataWithRefresh:isRefresh];
}

- (void)reloadData {
    [self.tableView setContentOffset:CGPointZero];
    [self beginRefreshing];
    [self requestHandlerWithRefresh:YES];  //重新加载数据
}


#pragma mark -- 下拉刷新动画

- (void)beginRefreshing {
    [self.tableView.mj_header beginRefreshing];
}

- (void)endRefreshing {
    [self.tableView.mj_header endRefreshing];
}

- (void)endLoadMore {
    [self.tableView.mj_footer endRefreshing];
}



#pragma mark - Accessor

/* 隐藏下拉刷新 */
- (void)setHideHeaderRefresh:(BOOL)hideHeaderRefresh {
    
    _hideHeaderRefresh = hideHeaderRefresh;
    self.tableView.mj_header.hidden = hideHeaderRefresh;
}

/* 隐藏加载更多 */
- (void)setHideFooterLoadMore:(BOOL)hideFooterLoadMore {
    
    _hideFooterLoadMore = hideFooterLoadMore;
    self.tableView.mj_footer.hidden = hideFooterLoadMore;
}




#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
