//
//  XNBaseViewModel.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseViewModel.h"

@interface XNBaseViewModel ()

@property (nonatomic, strong) RACSubject *toastSubject;
@property (nonatomic, strong) RACSubject *loadingSubject;
@property (nonatomic, strong) RACSubject *successSubject;
@property (nonatomic, strong) RACSubject *errorSubject;

@end

@implementation XNBaseViewModel


#pragma mark - Public Methods

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    
    //初始化各个subject
    self.toastSubject   = [RACSubject subject];
    self.loadingSubject = [RACSubject subject];
    self.successSubject = [RACSubject subject];
    self.errorSubject   = [RACSubject subject];
    
}


#pragma mark - 模板方法

- (BOOL)validForm
{
    return NO;
}


- (void)sendRequest:(XNBaseRequest *)req
        showLoading:(BOOL)showLoading
        entityClass:(Class)entityCls
       successBlock:(XNRequestCompleteBlock)successBlock
{
    //显示loading
    if (showLoading) {
        [self.loadingSubject sendNext:@(YES)];
    }
    
    @weakify(self);
    [[XNHttpClient sharedInstance] sendRequest:req entityClass:entityCls completeBlock:^(XNBaseResponse *response) {
        @strongify(self);
        
        //隐藏loading
        if (showLoading) {
            [self.loadingSubject sendNext:@(NO)];
        }
        
        if (response.error) {
            //失败
            [self.errorSubject sendNext:(RACTuplePack(req.tag, response.error))];
        } else {
            
            if (successBlock) {
                successBlock(response);
            }
            
            //请求成功
            [self.successSubject sendNext:(RACTuplePack(req.tag, response))];
        }
    }];
}


@end
