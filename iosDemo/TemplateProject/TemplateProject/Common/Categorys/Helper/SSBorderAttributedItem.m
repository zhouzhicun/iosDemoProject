//
//  SSBorderAttributedItem.m
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "SSBorderAttributedItem.h"

@implementation SSBorderAttributedItem

- (instancetype)initWithWidth:(NSNumber *)width
                        color:(UIColor *)color
                       radius:(NSNumber *)radius {
    
    self = [super init];
    if (self) {
        self.width = width;
        self.color = color;
        self.radius = radius;
    }
    return self;
    
}


+ (instancetype)itemWithWidth:(NSNumber *)width
                        color:(UIColor *)color
                       radius:(NSNumber *)radius {
    return [[SSBorderAttributedItem alloc] initWithWidth:width color:color radius:radius];
}




@end
