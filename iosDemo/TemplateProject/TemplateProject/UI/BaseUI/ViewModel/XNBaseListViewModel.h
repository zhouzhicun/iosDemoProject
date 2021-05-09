//
//  XNBaseListViewModel.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNBaseViewModel.h"

typedef NS_ENUM(NSUInteger, XNLListViewType) {
    XNLListViewType_Normal,         //普通列表
    XNLListViewType_Refresh,        //可下拉刷新
    XNLListViewType_Paged,          //分页，下拉刷新+加载更多
};



@interface XNBaseListViewModel : XNBaseViewModel


//列表样式
@property (nonatomic, assign, readonly) XNLListViewType listType;

//entity数组
@property (nonatomic, strong, readonly) NSMutableArray *entityArr;


#pragma mark - 分页
@property(nonatomic, assign, readonly) NSInteger total;            //数据总共条数
@property(nonatomic, assign, readonly) NSInteger pageIndex;        //页序号
@property(nonatomic, assign, readonly) NSInteger pageSize;         //页大小
@property(nonatomic, assign, readonly) BOOL hasMore;               //有更多

//停止刷新动画
@property (nonatomic, strong, readonly) RACSubject *endRefreshSignal;
//停止加载更多
@property (nonatomic, strong, readonly) RACSubject *endLoadMoreSignal;
//隐藏加载更多
@property (nonatomic, strong, readonly) RACSubject *hideLoadMoreSignal;


//Init
- (instancetype)initWithListType:(XNLListViewType)listViewType;



#pragma mark - 下拉刷新列表方法

//提供默认实现
- (void)refreshDataWithReq:(XNBaseRequest *)req
              successBlock:(XNRequestCompleteBlock)successBlock;


#pragma mark - 分页模板方法

//子类必须重写，并返回请求子类
- (XNBaseRequest *)getPagedRequest;

//获取分页数据，提供默认实现
- (void)fetchDataWithRefresh:(BOOL)isRefresh;
- (void)fetchDataWithRefresh:(BOOL)isRefresh successBlock:(XNRequestCompleteBlock)successBlock;

//默认解析数据
- (void)defaultHandleResponse:(XNBaseResponse *)baseResponse Refresh:(BOOL)isRefresh;

//处理数据，提供默认实现
//下面两个方法主要是应对非统一的分页数据
- (void)handleDataArr:(NSArray *)dataArr isRefresh:(BOOL)isRefresh;
- (void)handleDataArr:(NSArray *)dataArr total:(NSInteger)total isRefresh:(BOOL)isRefresh;


@end


