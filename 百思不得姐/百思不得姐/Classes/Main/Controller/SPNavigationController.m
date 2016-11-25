//
//  SPNavigationController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPNavigationController.h"

@interface SPNavigationController ()

@end

@implementation SPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.interactivePopGestureRecognizer);
}
#pragma mark-
#pragma mark- 设置导航条的内容
+(void)load{
//    获取当前类的导航条
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navigationBar setTitleTextAttributes:attri];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}
#pragma mark-
#pragma mark- 设置返回按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateSelected];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
