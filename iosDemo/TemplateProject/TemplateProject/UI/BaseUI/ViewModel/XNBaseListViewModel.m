//
//  XNBaseListViewModel.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseListViewModel.h"

@interface XNBaseListViewModel ()


//列表样式
@property (nonatomic, assign) XNLListViewType listType;

//entity数组
@property (nonatomic, strong) NSMutableArray *entityArr;


#pragma mark - 分页
@property(nonatomic, assign) NSInteger total;            //数据总共条数
@property(nonatomic, assign) NSInteger pageIndex;        //页序号
@property(nonatomic, assign) NSInteger tempPageIndex;    //页序号，用于构造分页请求，防止分页请求失败的情况下导致错误分页号。
@property(nonatomic, assign) NSInteger pageSize;         //页大小
@property(nonatomic, assign) BOOL hasMore;               //有更多

//停止刷新动画
@property (nonatomic, strong) RACSubject *endRefreshSignal;
//停止加载更多
@property (nonatomic, strong) RACSubject *endLoadMoreSignal;
//隐藏加载更多
@property (nonatomic, strong) RACSubject *hideLoadMoreSignal;

@end



@implementation XNBaseListViewModel


- (instancetype)initWithListType:(XNLListViewType)listViewType {
    
    self = [super init];
    if (self) {
        
        //默认初始化
        self.total          = 0;
        self.pageIndex      = 0;
        self.tempPageIndex  = 0;
        self.pageSize       = 0;
        self.hasMore        = 0;
        self.endRefreshSignal  = nil;
        self.endLoadMoreSignal = nil;
        self.endLoadMoreSignal = nil;
        
        self.listType = listViewType;
        
        [self commonInit];
    }
    return self;
}

- (void)commonInit {

    [super commonInit];
    
    switch (self.listType) {
        case XNLListViewType_Normal:
        {
            //nothing
            break;
        }
        case XNLListViewType_Refresh:
        {
            //下拉刷新列表
            [self initRefreshList];
            break;
        }
        case XNLListViewType_Paged:
        {
            //分页列表
            [self initPageList];
            break;
        }
    }
}


#pragma mark - Private

//初始化下拉刷新列表
- (void)initRefreshList
{
    self.endRefreshSignal = [RACSubject subject];
}

//初始化分页列表
- (void)initPageList {

    [self resetPageInfo];
    self.endRefreshSignal   = [RACSubject subject];
    self.endLoadMoreSignal  = [RACSubject subject];
    self.hideLoadMoreSignal = [RACSubject subject];
}

//重置分页信息
- (void)resetPageInfo
{
    self.pageIndex  = 1;
    self.pageSize   = 20;
    self.total      = 0;
    self.hasMore    = 0;
}




#pragma mark - 下拉刷新列表方法

- (void)refreshDataWithReq:(XNBaseRequest *)req
              successBlock:(XNRequestCompleteBlock)successBlock
{
    @weakify(self);
    [[XNHttpClient sharedInstance] sendRequest:req completeBlock:^(XNBaseResponse *response) {
        
        @strongify(self);
        
        //停止动画
        [self endAnimationWithRefresh:YES];
        
        if (response.error) {
            //失败
            [self.errorSubject sendNext:(RACTuplePack(req.tag, response.error))];
        } else {
            
            //如果有设置successBlock，则在successBlock中解析并保存数据，否则默认处理
            if (successBlock) {
                successBlock(response);
            }
            
            //3. 发送信号
            if (self.hasMore) {
                [self.hideLoadMoreSignal sendNext:@(NO)];
            } else {
                [self.hideLoadMoreSignal sendNext:@(YES)];
            }
            [self.successSubject sendNext:(RACTuplePack(req.tag, nil))];
        }
    }];
}







#pragma mark - 分页模板方法

- (XNBaseRequest *)getPagedRequest
{
    //子类必须重写，并返回请求子类
    //构造的分页请求，PageIndex 必须取自tempPageIndex
    return nil;
}

//停止动画
- (void)endAnimationWithRefresh:(BOOL)isRefresh {
    if (isRefresh) {
        //下拉刷新
        if (self.listType == XNLListViewType_Refresh ||
            self.listType == XNLListViewType_Paged) {
            [self.endRefreshSignal sendNext:@(1)];
        }
    } else {
        //加载更多
        if (self.listType == XNLListViewType_Paged) {
            [self.endLoadMoreSignal sendNext:@(1)];
        }
    }
}

//分页请求
- (void)fetchDataWithRefresh:(BOOL)isRefresh
{
    [self fetchDataWithRefresh:isRefresh successBlock:nil];
}

//分页请求
- (void)fetchDataWithRefresh:(BOOL)isRefresh
                successBlock:(XNRequestCompleteBlock)successBlock
{
    //更新tempPageIndex
    [self updatePageIndexWithRefresh:isRefresh];
    XNBaseRequest *request = [self getPagedRequest];
    
    @weakify(self);
    [[XNHttpClient sharedInstance] sendRequest:request completeBlock:^(XNBaseResponse *response) {
        
        @strongify(self);
        
        //停止动画
        [self endAnimationWithRefresh:isRefresh];
        
        if (response.error) {
            //失败
            [self.errorSubject sendNext:(RACTuplePack(request.tag, response.error))];
            
        } else {
            //成功
            //如果有设置successBlock，则在successBlock中解析并保存数据，否则默认处理
            if (successBlock) {
                successBlock(response);
            } else {
                [self defaultHandleResponse:response Refresh:isRefresh];
            }
            
            //2.更新页码
            self.pageIndex = self.tempPageIndex;
            
            //3. 发送信号
            if (self.hasMore) {
                [self.hideLoadMoreSignal sendNext:@(NO)];
            } else {
                [self.hideLoadMoreSignal sendNext:@(YES)];
            }
            [self.successSubject sendNext:(RACTuplePack(request.tag, nil))];
        }
    }];
    
}



//默认解析数据
- (void)defaultHandleResponse:(XNBaseResponse *)baseResponse Refresh:(BOOL)isRefresh
{
    //请求成功
    NSArray *datas = (NSArray *)baseResponse.response;
    [self handleDataArr:datas isRefresh:isRefresh];
}


//处理返回的数据
- (void)handleDataArr:(NSArray *)dataArr total:(NSInteger)total isRefresh:(BOOL)isRefresh
{
    if (isRefresh) {
        [self.entityArr removeAllObjects];
    }
    [self.entityArr addObjectsFromArray:dataArr];
    
    //是否拥有更多
    if (total > self.entityArr.count) {
        self.hasMore = YES;
    } else {
        self.hasMore = NO;
    }
}

//处理返回的数据
- (void)handleDataArr:(NSArray *)dataArr isRefresh:(BOOL)isRefresh
{
    //是否拥有更多
    if (dataArr.count == self.pageSize) {
        self.hasMore = YES;
    } else {
        self.hasMore = NO;
    }
    
    if (isRefresh) {
        [self.entityArr removeAllObjects];
    }
    [self.entityArr addObjectsFromArray:dataArr];
}




#pragma mark - Private

//更新分页状态数据
- (void)updatePageIndexWithRefresh:(BOOL)isRefresh {
    
    if (isRefresh) {
        //刷新时，直接设置为1
        self.tempPageIndex = 1;
    } else {
        //分页列表，temp = pageIndex + 1;
        if (self.listType == XNLListViewType_Paged) {
            self.tempPageIndex = self.pageIndex + 1;
        }
    }
}


#pragma mark - Property

- (NSMutableArray *)entityArr {
    if (!_entityArr) {
        _entityArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _entityArr;
}

@end
