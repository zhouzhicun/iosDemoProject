//
//  XNBaseView.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface XNBaseView : UIView

@property(nonatomic, copy) NSString *name;

#pragma mark - Init

- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;


/**
 * common初始化, 只供调用，不重写。
 * 自定义View时，需要外部传入特定参数，此时init和initWithFrame无法满足要求,因此新增一个init方法，并在新增的Init方法中调用commonInit。
 *
 */
- (void)commonInit;


#pragma mark - UI模板方法

//设置subView
- (void)setupSubView;

//设置布局
- (void)setupConstraint;

//设置事件处理
- (void)setupEvent;


#pragma mark -- View高度模板方法

- (CGFloat)viewHeight;
+ (CGFloat)viewHeight;


@end


