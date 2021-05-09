//
//  XNBaseView.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseView.h"

@implementation XNBaseView


#pragma mark - Init

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
    
  //  [self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>]
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    [self setupSubView];
    [self setupConstraint];
    [self setupEvent];
}


#pragma mark - UI

//设置subView(子类重写)
- (void)setupSubView {}

//设置布局(子类重写)
- (void)setupConstraint {}

//设置事件处理(子类重写)
- (void)setupEvent {}


#pragma mark - View高度

- (CGFloat)viewHeight
{
    return 0.0f;
}

+ (CGFloat)viewHeight
{
    return 0.0f;
}

@end
