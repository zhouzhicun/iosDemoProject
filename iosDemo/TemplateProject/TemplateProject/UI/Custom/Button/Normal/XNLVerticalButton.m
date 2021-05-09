//
//  XNLHorizontalButton.m
//  yndBtc
//
//  Created by xiaoniu on 2019/6/27.
//  Copyright © 2019 ynd. All rights reserved.
//

#import "XNLVerticalButton.h"

@implementation XNLVerticalButton



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.backgroundColor = [UIColor blackColor];
    self.titleLabel.backgroundColor = [UIColor blackColor];
    
    CGSize buttonSize = self.bounds.size;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
 
    switch (self.alignType) {
            
        case XNLButtonSubViewAlignType_Title_Image:{
            //垂直-Title-Image
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = 0;
                rect.size = titleSize;
                rect;
            });
            
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = buttonSize.height - imageSize.height;
                rect.size = imageSize;
                rect;
            });
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            //垂直-Image-Title
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = 0;
                rect.size = imageSize;
                rect;
            });
            
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = buttonSize.height - titleSize.height;
                rect.size = titleSize;
                rect;
            });
            break;
        }
            
    }
}

@end
