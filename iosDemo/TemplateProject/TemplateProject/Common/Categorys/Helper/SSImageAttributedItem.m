//
//  SSImageAttributedItem.m
//  
//
//  Created by xiaoniu on 2018/6/30.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "SSImageAttributedItem.h"


#pragma mark - Image

@implementation SSImageAttributedItem

- (instancetype)initWithNormalName:(NSString *)normal
                     highLightName:(NSString *)highLight
                      selectedName:(NSString *)selected
                       disableName:(NSString *)disable {
    self = [super init];
    if (self) {
        self.itemType       = SSImageAttributedItemType_Name;
        self.normalName     = normal;
        self.highLightName  = highLight;
        self.selectedName   = selected;
        self.disableName    = disable;
    }
    return self;
}

- (instancetype)initWithNormalImage:(UIImage *)normal
                     highLightImage:(UIImage *)highLight
                      selectedImage:(UIImage *)selected
                       disableImage:(UIImage *)disable {
    self = [super init];
    if (self) {
        self.itemType       = SSImageAttributedItemType_Image;
        self.normalImage    = normal;
        self.highLightImage = highLight;
        self.selectedImage  = selected;
        self.disableImage   = disable;
    }
    return self;
}


+ (instancetype)nameItemWithNormal:(NSString *)normal
                              High:(NSString *)high
                          Selected:(NSString *)selected
                           Disable:(NSString *)disable {
    return [[SSImageAttributedItem alloc] initWithNormalName:normal highLightName:high selectedName:selected disableName:disable];
}

+ (instancetype)imageItemWithNormal:(UIImage *)normal
                               High:(UIImage *)high
                           Selected:(UIImage *)selected
                            Disable:(UIImage *)disable {
    return [[SSImageAttributedItem alloc] initWithNormalImage:normal highLightImage:high selectedImage:selected disableImage:disable];
}

@end
