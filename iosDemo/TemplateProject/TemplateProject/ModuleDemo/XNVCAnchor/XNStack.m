//
//  XNStack.m
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import "XNStack.h"

@interface XNStack ()

@property (nonatomic, strong) NSMutableArray *itemArr;

@end

@implementation XNStack


- (void)push:(id)item {
    if (item) {
        [self.itemArr addObject:item];
    }
}

- (id)pop {
    
    id obj = self.itemArr.lastObject;
    if (obj) {
       [self.itemArr removeObject:obj];
    }
    return obj;
}

- (void)clear {
    [self.itemArr removeAllObjects];
}

#pragma mark - Property

- (NSUInteger)count {
    return self.itemArr.count;
}

- (NSMutableArray *)itemArr {
    if (!_itemArr) {
        _itemArr = [NSMutableArray array];
    }
    return _itemArr;
}

@end
