//
//  XNLHorizontalButton.m
//  yndBtc
//
//  Created by xiaoniu on 2019/6/27.
//  Copyright © 2019 ynd. All rights reserved.
//

#import "XNLFixSizeHorizontalButton.h"

@implementation XNLFixSizeHorizontalButton

//居中
- (void)centerLayout {
    
    CGSize buttonSize = self.bounds.size;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    
    //间距值
    CGFloat space = self.space.floatValue;
    CGFloat leftPadding = (buttonSize.width - titleSize.width - imageSize.width - space) / 2.0;
    
    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            
            //水平-Title-Image
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = leftPadding;
                rect.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                rect.size = titleSize;
                rect;
            });
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = leftPadding + titleSize.width + space;
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
                rect.origin.x = leftPadding;
                rect.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                rect.size = imageSize;
                rect;
            });
            
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = leftPadding + imageSize.width + space;
                rect.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                rect.size = titleSize;
                rect;
            });
            
            break;
        }
    }
}


//线性左布局:从左到右
- (void)linearLeadingLayout {
    
    
    CGSize buttonSize = self.bounds.size;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    
    //间距值,边距
    CGFloat space = self.space.floatValue;
    CGFloat leftPadding = self.padding.floatValue;

    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            
            //水平-Title-Image
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = leftPadding;
                frame.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                frame.size = titleSize;
                frame;
            });
            
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = leftPadding + titleSize.width + space;
                frame.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                frame.size = imageSize;
                frame;
            });
            
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            
            //水平-Image-Title
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = leftPadding;
                frame.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                frame.size = imageSize;
                frame;
            });
            
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = leftPadding + imageSize.width + space;
                frame.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                frame.size = titleSize;
                frame;
            });
            
            break;
        }
    }
    
}



//线性右布局:从右边到左边
- (void)linearTailLayout {
    
    CGSize buttonSize = self.bounds.size;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    
    //间距值,边距
    CGFloat space = self.space.floatValue;
    CGFloat rightPadding = self.padding.floatValue;
    
    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            //水平-Title-Image
            CGFloat titleX = buttonSize.width - titleSize.width - rightPadding;
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = titleX;
                frame.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                frame.size = titleSize;
                frame;
            });
            
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = titleX - imageSize.width - space;
                frame.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                frame.size = imageSize;
                frame;
            });
            
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            //水平-Image-Title
            CGFloat imageX = buttonSize.width - imageSize.width - rightPadding;
            self.imageView.frame = ({
                CGRect frame = self.imageView.frame;
                frame.origin.x = imageX;
                frame.origin.y = (buttonSize.height - imageSize.height) / 2.0;
                frame.size = imageSize;
                frame;
            });
            
            self.titleLabel.frame = ({
                CGRect frame = self.titleLabel.frame;
                frame.origin.x = imageX - titleSize.width - space;
                frame.origin.y = (buttonSize.height - titleSize.height) / 2.0;
                frame.size = titleSize;
                frame;
            });
            
            break;
        }
    }
    
}




@end
