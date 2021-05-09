//
//  XNBaseTableViewCell.h
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface XNBaseTableViewCell : UITableViewCell

#pragma mark - Init

- (id)init;

- (id)initWithFrame:(CGRect)frame;

+ (id)createCell;

+ (instancetype)cellForTableView:(UITableView *)tableView;


#pragma mark - UI模板方法

//设置subView
- (void)setupSubView;

//设置布局
- (void)setupConstraint;

//设置事件处理
- (void)setupEvent;

- (void)bindModel:(id)model;

#pragma mark -- cell高度模板方法

- (CGFloat)cellHeight;
+ (CGFloat)cellHeight;



@end


