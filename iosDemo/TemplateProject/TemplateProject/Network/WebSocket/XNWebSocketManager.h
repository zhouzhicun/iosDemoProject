//
//  XNWebSocketManager.h
//  yndBtc
//
//  Created by xiaoniu on 2019/7/20.
//  Copyright © 2019 ynd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNGlobalMacros.h"
#import <RACSubject.h>

@interface XNWebSocketManager : NSObject


AS_SINGLETON(XNWebSocketManager)

@property (nonatomic, copy) NSString *wsUrl;        //wsurl
@property (nonatomic, assign) BOOL isConnected;     //是否已连接

//连接成功
@property (nonatomic, strong) RACSubject *connectedSubject;

//收到消息
@property (nonatomic, strong) RACSubject *receiveMsgSubject;


/**
 重连
 */
- (void)reconnect;

/**
 关闭
 */
- (void)close;

/**
 发送ping
 */
- (void)sendPing;

/**
 发送消息
 */
- (void)sendMsgDic:(NSDictionary *)msgDic;

@end

