//
//  SSColorAttributedItem.m
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "SSColorAttributedItem.h"


#pragma mark - Color

@implementation SSColorAttributedItem

- (instancetype)initWithNormalColor:(UIColor *)normal
                     highLightColor:(UIColor *)highLight
                      selectedColor:(UIColor *)selected
                       disableColor:(UIColor *)disable {
    self = [super init];
    if (self) {
        self.normalColor = normal;
        self.highLightColor = highLight;
        self.selectedColor = selected;
        self.disableColor = disable;
    }
    return self;
}


+ (instancetype)itemWithNormal:(UIColor *)normal High:(UIColor *)high Selected:(UIColor *)selected Disable:(UIColor *)disable {
    return [[SSColorAttributedItem alloc] initWithNormalColor:normal highLightColor:high selectedColor:selected disableColor:disable];
}

@end
