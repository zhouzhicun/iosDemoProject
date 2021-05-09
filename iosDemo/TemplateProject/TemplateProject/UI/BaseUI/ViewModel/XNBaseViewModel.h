//
//  XNBaseViewModel.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <ReactiveObjC/ReactiveObjC.h>

#import "XNBaseRequest.h"
#import "XNBaseResponse.h"
#import "XNHttpClient.h"



@interface XNBaseViewModel : NSObject

/**
 * 导航栏title
 */
@property (nonatomic, copy) NSString *navBarTitle;


/**
 * toast, 常用于校验弹toast
 * 返回NSString: message
 */
@property (nonatomic, strong, readonly) RACSubject *toastSubject;

/**
 * loading, 常用于接口请求
 * 返回NSNumber: YES, NO
 */
@property (nonatomic, strong, readonly) RACSubject *loadingSubject;

/**
 * success
 * 返回RACTuple(eventName, obj), 常用于接口请求，此时eventName使用API即可。
 */
@property (nonatomic, strong, readonly) RACSubject *successSubject;

/**
 * failed
 * 返回RACTuple(eventName, NSError), 常用于接口请求，此时eventName使用API即可。
 */
@property (nonatomic, strong, readonly) RACSubject *errorSubject;


- (void)commonInit;


#pragma mark - 模板方法

/** 表单校验 */
- (BOOL)validForm;

/** 发送请求 */
- (void)sendRequest:(XNBaseRequest *)req
        showLoading:(BOOL)showLoading
        entityClass:(Class)entityCls
       successBlock:(XNRequestCompleteBlock)successBlock;

@end


