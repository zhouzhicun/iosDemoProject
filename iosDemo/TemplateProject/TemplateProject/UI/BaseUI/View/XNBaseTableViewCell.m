//
//  XNBaseTableViewCell.m
//  TemplateProject
//
//  Created by zzc on 2020/1/2.
//  Copyright © 2020 zzc. All rights reserved.
//

#import "XNBaseTableViewCell.h"
#import "UITableViewCell+SSToolkitAdditions.h"

@implementation XNBaseTableViewCell


#pragma mark - Init

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    self.frame = frame;
    return self;
}

+ (id)createCell {
    return [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self ss_cellIdentifier]];
}

+ (instancetype)cellForTableView:(UITableView *)tableView {
    
    NSString *cellIdentifier = [self ss_cellIdentifier];
    XNBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [self createCell];
    }
    return cell;
}


#pragma mark -- Private Init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //默认设置
        [self defaultSetup];
        [self commonInit];
    }
    
    return self;
}


- (void)commonInit {
    //子类初始化
    [self setupSubView];
    [self setupConstraint];
    [self setupEvent];
}


#pragma mark - UI

- (void)setupSubView {}
- (void)setupConstraint {}
- (void)setupEvent {}


#pragma mark - cell高度

- (CGFloat)cellHeight {
    return 0.0f;
}

+ (CGFloat)cellHeight {
    return 0.0f;
}

- (void)bindModel:(NSDictionary *)model {
    
}

#pragma mark - Private

+ (NSString *)cellIdentifier {
    return [self ss_cellIdentifier];
}

//默认设置
- (void)defaultSetup {
    
    self.backgroundColor = [UIColor whiteColor];
    self.backgroundView = nil;
    self.selectedBackgroundView = nil;

    [self.textLabel setHidden:YES];
    [self.detailTextLabel setHidden:YES];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}




@end
