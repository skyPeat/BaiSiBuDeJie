//
//  SPNavigationController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPNavigationController.h"

@interface SPNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //   设置导航条
    [self setUpNavigationBar];
    //    添加全屏滑动手势
    [self addGesture];
}
#pragma mark- 设置导航条
-(void)setUpNavigationBar{
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navigationBar setTitleTextAttributes:attri];
    //设置导航条的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark- 设置全局返回按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamedWithRenderImageName:@"navigationButtonReturn"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)backButtonClick{
    [self popViewControllerAnimated:YES];
}
#pragma mark- 设置全屏滑动
-(void)addGesture{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}
@end
