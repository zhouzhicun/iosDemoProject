//
//  XNLButtonConstants.h
//  yndBtc
//
//  Created by xiaoniu on 2019/7/18.
//  Copyright © 2019 ynd. All rights reserved.
//

#ifndef XNLButtonConstants_h
#define XNLButtonConstants_h


typedef NS_ENUM(NSUInteger, XNLButtonSubViewAlignType) {
    XNLButtonSubViewAlignType_Title_Image,      //title-图标
    XNLButtonSubViewAlignType_Image_Title,      //图标-title
};

typedef NS_ENUM(NSUInteger, XNLButtonContentLayoutType) {
    XNLButtonContentLayoutType_Center,           //整体居中
    XNLButtonContentLayoutType_Linear_Leading,   //线性布局:从左到右,或者从上到下
    XNLButtonContentLayoutType_Linear_Tail,     //线性布局:从右到左，或者从底到顶
};


#endif /* XNLButtonConstants_h */
