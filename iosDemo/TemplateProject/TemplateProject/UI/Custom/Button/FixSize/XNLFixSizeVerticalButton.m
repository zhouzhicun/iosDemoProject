//
//  XNLVerticalButton.m
//  yndBtc
//
//  Created by xiaoniu on 2019/6/27.
//  Copyright © 2019 ynd. All rights reserved.
//

#import "XNLFixSizeVerticalButton.h"

@implementation XNLFixSizeVerticalButton


//居中
- (void)centerLayout {
    
    CGSize buttonSize = self.bounds.size;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    
    //间距值
    CGFloat space = self.space.floatValue;
    CGFloat topPadding = (buttonSize.height - titleSize.height - imageSize.height - space) / 2.0;
    
    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            
            //Title-Image
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = topPadding;
                rect.size = titleSize;
                rect;
            });
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = topPadding + titleSize.height + space;
                rect.size = imageSize;
                rect;
            });
            
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            //水平-Image-Title
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = topPadding;
                rect.size = imageSize;
                rect;
            });
            
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = topPadding + imageSize.height + space;
                rect.size = titleSize;
                rect;
            });
            
            break;
        }
    }
}


//线性左布局:从到右
- (void)linearLeadingLayout {
    
    
    CGSize buttonSize = self.bounds.size;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize imageSize = self.imageView.intrinsicContentSize;
    
    //间距值,边距
    CGFloat space = self.space.floatValue;
    CGFloat topPadding = self.padding.floatValue;
    
    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            
            //Title-Image
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = topPadding;
                rect.size = titleSize;
                rect;
            });
            
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = topPadding + titleSize.height + space;
                rect.size = imageSize;
                rect;
            });
            
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            
            //水平-Image-Title
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = topPadding;
                rect.size = imageSize;
                rect;
            });
            
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = topPadding + imageSize.height + space;
                rect.size = titleSize;
                rect;
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
    CGFloat bottomPadding = self.padding.floatValue;
    
    switch (self.alignType) {
        case XNLButtonSubViewAlignType_Title_Image:{
            //水平-Title-Image
            CGFloat titleY = buttonSize.height - bottomPadding - titleSize.height;
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = titleY;
                rect.size = titleSize;
                rect;
            });
            
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = titleY - space - imageSize.height;
                rect.size = imageSize;
                rect;
            });
            
            break;
        }
        case XNLButtonSubViewAlignType_Image_Title:{
            //水平-Image-Title
            CGFloat imageY = buttonSize.height - bottomPadding - imageSize.height;
            self.imageView.frame = ({
                CGRect rect = self.imageView.frame;
                rect.origin.x = (buttonSize.width - imageSize.width) / 2.0;
                rect.origin.y = imageY;
                rect.size = imageSize;
                rect;
            });
            
            self.titleLabel.frame = ({
                CGRect rect = self.titleLabel.frame;
                rect.origin.x = (buttonSize.width - titleSize.width) / 2.0;
                rect.origin.y = imageY - space - titleSize.height;
                rect.size = titleSize;
                rect;
            });
            
            break;
        }
    }
    
}




@end
