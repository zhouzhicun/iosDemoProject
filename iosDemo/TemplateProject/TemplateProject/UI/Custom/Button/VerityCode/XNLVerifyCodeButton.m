//
//  XNLVerifyCodeButton.m
//  XNLoan
//
//  Created by xiaoniu on 16/8/22.
//  Copyright © 2016年 xiaoniu88. All rights reserved.
//

#import "XNLVerifyCodeButton.h"
#import "XNGlobalMacros.h"
#import <Masonry/Masonry.h>

#define XNLCountDownMaxTime 60

@interface XNLVerifyCodeButton ()

/* 计时器 */
@property (nonatomic, strong) dispatch_source_t timer;

/* 倒计时最大时间值 */
@property (nonatomic, assign) int maxTime;

/* 倒计时剩余时间值 */
@property (nonatomic, assign) int remainTime;


/* 默认Title */
@property (nonatomic, copy) NSString *defaultTitle;

@end

@implementation XNLVerifyCodeButton


- (void)dealloc
{
    [self clearTime];
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self commonInit];
}

- (void)commonInit {
    
    
    self.defaultTitle = nil; //XNLocalized(@"register_regetCode");
    self.maxTime      = XNLCountDownMaxTime;
    self.remainTime   = XNLCountDownMaxTime;
    
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}





#pragma mark - 设置样式

- (void)setupStyleWithHasBorder:(BOOL)hasBorder
{
    
//    if (hasBorder) {
//        
//        //有边框
//        //2 标题颜色+字体大小
//        [self setTitleColor:HEXCOLOR(0xd14b66) forState:UIControlStateNormal];
//        [self setTitleColor:HEXCOLOR(0xd14b66) forState:UIControlStateHighlighted];
//        [self setTitleColor:HEXCOLOR(0xd14b66) forState:UIControlStateDisabled];
//
//        [self.titleLabel setFont:scaleFontSize(12)];
//        
//        
//        //3 圆角半径+边框
//        [self ss_setCornerRadius:4.0f];
//        CGFloat borderWidth = 1.0f;
//        [self ss_setBorderWidth:borderWidth borderColor:kC11_GlobalColor];
//        
//    } else {
//        
//        //无边框
//        
//        //1 背景色
//        self.backgroundColor = [UIColor clearColor];
//        
//        //2 标题颜色+字体大小
//        [self setTitleColor:kC4_GlobalColor forState:UIControlStateNormal];
//        [self setTitle:self.defaultTitle forState:UIControlStateNormal];
//        
//        self.titleLabel.font = kFontSize(12);
//
//        
//    }
}


- (void)buttonPressed:(id)sender {
    
    if (self.countDownHandlerBlock && self.countDownHandlerBlock()) {
        
        //开始计时
        [self startCountDown];
    }
}



- (void)setDefaultTitle:(NSString *)defaultTitle {
    
    if (_defaultTitle != defaultTitle) {
        
        _defaultTitle = defaultTitle;
        [self setTitle:defaultTitle forState:UIControlStateNormal];
    }
}


#pragma mark - Private


- (void)updateRemainTime
{
    WEAKSELF;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *strTime = [NSString stringWithFormat:@"%d%@", weakSelf.remainTime, nil/*XNLocalized(@"register_countDown")*/];
        [weakSelf setTitle:strTime forState:UIControlStateDisabled];
    });
}


- (void)startCountDown {
    
    WEAKSELF;
    
    self.enabled = NO;
    self.remainTime = self.maxTime; //倒计时时间
    
    //销毁当前的定时器
    [self clearTime];

    //创建新的定时器
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1.0f * NSEC_PER_SEC, 0.0f * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        if(weakSelf.remainTime <= 0) {
            // 倒计时结束，关闭
            [weakSelf stopCountDown];
        } else {
            // 更新倒计时
            [weakSelf updateRemainTime];
            // 计时减1
            weakSelf.remainTime -= 1;
        }
    });
    
    dispatch_resume(_timer);
}



- (void)stopCountDown {
    [self clearTime];
    dispatch_async(dispatch_get_main_queue(), ^{
        // 倒计时时，获取按钮不可用
        self.enabled = YES;
        // 更新标题
        [self setTitle:self.defaultTitle  forState:UIControlStateNormal];
    });
}

#pragma mark - 销毁定时器

- (void)clearTime
{
    //销毁当前的定时器
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
}

@end
