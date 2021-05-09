//
//  XNStack.h
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XNStack : NSObject

//元素数组
@property (nonatomic, strong, readonly) NSMutableArray *itemArr;

//栈元素个数
@property (nonatomic, assign, readonly) NSUInteger count;

//入栈
- (void)push:(id)item;

//出栈
- (id)pop;

//清空栈
- (void)clear;

@end
