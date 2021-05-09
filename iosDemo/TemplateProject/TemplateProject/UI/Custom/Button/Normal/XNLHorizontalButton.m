//
//  XNLHorizontalButton.m
//  yndBtc
//
//  Created by xiaoniu on 2019/6/27.
//  Copyright © 2019 ynd. All rights reserved.
//

#import "XNLHorizontalButton.h"

@implementation XNLHorizontalButton


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize buttonSize = self.bounds.size;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    
    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            
            //水平-Title-Image
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = 0;
                rect.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                rect.size = titleSize;
                rect;
            });
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = buttonSize.width - imageSize.width;
                rect.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                rect.size = imageSize;
                rect;
            });
            
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            //水平-Image-Title
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = 0;
                rect.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                rect.size = imageSize;
                rect;
            });
            
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = buttonSize.width - titleSize.width;
                rect.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                rect.size = titleSize;
                rect;
            });
            break;
        }
    }
}

@end
