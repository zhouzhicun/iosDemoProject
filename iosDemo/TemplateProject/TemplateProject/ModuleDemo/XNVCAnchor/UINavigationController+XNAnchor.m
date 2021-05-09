//
//  UINavigationController+XNStack.m
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import "UINavigationController+XNAnchor.h"

#import <objc/runtime.h>
#import "UIViewController+XNAnchor.h"

@implementation UINavigationController (XNAnchor)


#pragma mark - 方法混写

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        swizzleMethod([self class], @selector(pushViewController:animated:), @selector(XN_pushViewController:animated:));
        swizzleMethod([self class], @selector(popViewControllerAnimated:), @selector(XN_popViewControllerAnimated:));
        swizzleMethod([self class], @selector(popToRootViewControllerAnimated:), @selector(XN_popToRootViewControllerAnimated:));
        swizzleMethod([self class], @selector(popToViewController:animated:), @selector(XN_popToViewController:animated:));
    });
}


- (void)XN_pushViewController:(UIViewController *)vc animated:(BOOL)animated {

    //判断导航栏当前VC是否为锚点，是的话则添加到archorStack栈
    UIViewController *curVC = self.topViewController;
    if (curVC.isAnchor) {
        [self.anchorStack push:curVC];
    }
    [self XN_pushViewController:vc animated:animated];
}


- (UIViewController *)XN_popViewControllerAnimated:(BOOL)animated {
    
    //返回上一级页面
    UIViewController *popedVC = [self XN_popViewControllerAnimated:animated];
    [self clearAnchorWithPopedVCArr:(popedVC ? @[popedVC] : nil)];
    return popedVC;
}


- (NSArray *)XN_popToRootViewControllerAnimated:(BOOL)animated {
    
    //返回到rootVC
    NSArray *popedVCArr = [self XN_popToRootViewControllerAnimated:animated];
    [self clearAnchorWithPopedVCArr:popedVCArr];
    return popedVCArr;

}


- (NSArray *)XN_popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //返回到指定VC
    NSArray *popedVCArr = [self XN_popToViewController:viewController animated:animated];
    [self clearAnchorWithPopedVCArr:popedVCArr];
    return popedVCArr;
}




void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}






#pragma mark - Public

//pop到最后一个锚点VC, 如果没有锚点VC，则返回上一个界面
- (void)popToAnchorViewControllerAnimated:(BOOL)animated
{
    UIViewController *lastAnchorVC = [self.anchorStack pop];
    if (lastAnchorVC) {
        [self popToViewController:lastAnchorVC animated:animated];
    } else {
        [self popViewControllerAnimated:animated];
    }
}







#pragma mark - Private


- (void)clearAnchorWithPopedVCArr:(NSArray *)popedVCArr {
    
    //清除导航栏popedVC数组锚点
    for (UIViewController *temp in popedVCArr) {
        if (temp.isAnchor) {
            UIViewController *popedVC = [self.anchorStack pop];
            [popedVC clearAnchorAndExecuteBlock:NO];
        }
    }
    
    //判断导航栏当前栈顶是否是锚点
    UIViewController *topVC = self.topViewController;
    if (topVC.isAnchor) {
        [self.anchorStack pop];
    }
    [topVC clearAnchorAndExecuteBlock:YES];
}


#pragma mark - 懒加载初始化vcStack

- (XNStack *)anchorStack {
    XNStack *stack = objc_getAssociatedObject(self, @selector(anchorStack));
    if (!stack) {
        stack = [[XNStack alloc] init];
        objc_setAssociatedObject(self, @selector(anchorStack), stack, OBJC_ASSOCIATION_RETAIN);
    }
    return stack;
}

@end
