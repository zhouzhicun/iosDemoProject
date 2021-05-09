//
//  SSTextAttributedItem.m
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "SSTextAttributedItem.h"


#pragma mark - Text

@implementation SSTextAttributedItem

- (instancetype)initWithText:(NSString *)text
                        Font:(UIFont *)font
                       Color:(UIColor *)color
                         Url:(NSString *)url {
    self = [super init];
    if (self) {
        self.text = text;
        self.font = font;
        self.color = color;
        self.url = url;
    }
    return self;
}

+ (instancetype)itemWithText:(NSString *)text
                        Font:(UIFont *)font
                       Color:(UIColor *)color
                         Url:(NSString *)url {
    return [[SSTextAttributedItem alloc] initWithText:text Font:font Color:color Url:url];
}


@end
