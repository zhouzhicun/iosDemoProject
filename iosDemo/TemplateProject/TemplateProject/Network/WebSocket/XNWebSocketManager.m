//
//  XNWebSocketManager.m
//  yndBtc
//
//  Created by xiaoniu on 2019/7/20.
//  Copyright © 2019 ynd. All rights reserved.
//

#import "XNWebSocketManager.h"
#import <SocketRocket/SocketRocket.h>


@interface XNWebSocketManager() <SRWebSocketDelegate>

@property (nonatomic, strong) SRWebSocket *webSocket;

@end

@implementation XNWebSocketManager

DEF_SINGLETON(XNWebSocketManager)

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)reconnect
{

    [self close];
    
    self.webSocket =
    [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:self.wsUrl]];
    self.webSocket.delegate = self;
    [self.webSocket open];
}

- (void)close
{
    if (self.webSocket) {
        self.webSocket.delegate = nil;
        [self.webSocket close];
        
        self.isConnected = NO;
        self.webSocket = nil;
    }
}


- (void)sendPing
{
    [self.webSocket sendPing:nil];
}

- (void)sendMessage:(NSString *)message
{
    message =
    [message stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self.webSocket send:message];
}

- (void)sendMsgDic:(NSDictionary *)msgDic
{
    [self sendMessage:[self convertJsonStringFromObj:msgDic]];
}



#pragma mark - SRWebSocketDelegate

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    //NSLog(@"Received \"%@\"", message);
    [self.receiveMsgSubject sendNext:message];
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    //NSLog(@"Websocket Connected");
    self.isConnected = YES;
    [self.connectedSubject sendNext:@(YES)];
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    //NSLog(@":( Websocket Failed With Error %@", error);
    _webSocket = nil;
    self.isConnected = NO;
    [self.connectedSubject sendNext:@(NO)];
}


- (void)webSocket:(SRWebSocket *)webSocket
 didCloseWithCode:(NSInteger)code
           reason:(NSString *)reason
         wasClean:(BOOL)wasClean
{
    //NSLog(@"WebSocket closed");
    self.isConnected = NO;
    self.webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload
{
    //NSLog(@"WebSocket received pong");
}


#pragma mark - Private

//转换为json
- (NSString *)convertJsonStringFromObj:(id)obj {
    
    NSString *jsonStr = nil;
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
        if (data != nil) {
            jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return jsonStr;
}



#pragma mark - Setter

- (RACSubject *)connectedSubject
{
    if (!_connectedSubject) {
        _connectedSubject = [RACSubject subject];
    }
    return _connectedSubject;
}

- (RACSubject *)receiveMsgSubject
{
    if (!_receiveMsgSubject) {
        _receiveMsgSubject = [RACSubject subject];
    }
    return _receiveMsgSubject;
}






@end
