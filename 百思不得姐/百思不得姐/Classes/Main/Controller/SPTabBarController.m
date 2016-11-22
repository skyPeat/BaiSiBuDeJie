//
//  SPTabBarController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPTabBarController.h"
#import "SPNavigationController.h"
#import "SPEssenceViewController.h"
#import "SPNewViewController.h"
#import "SPPublishViewController.h"
#import "SPFriendTrendViewController.h"
#import "SPHomeViewController.h"

@interface SPTabBarController ()

@end

@implementation SPTabBarController
+(void)load{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    0、添加子控制器
    [self addChildViewController];
//    1、自定义tabBar
    [self setUpTabBar];
}
#pragma mark-
#pragma mark- 添加子控制器并设置底部按钮的内容
-(void)addChildViewController{
//    essence
    [self childViewController:[[SPEssenceViewController alloc] init] title:@"精华" normalImage:[UIImage imageNamed:@"tabBar_essence_icon"] selectedImage:[UIImage imageNamedWithOriginal:@"tabBar_essence_click_icon"]];
//    new
    [self childViewController:[[SPNewViewController alloc] init] title:@"新帖" normalImage:[UIImage imageNamed:@"tabBar_new_icon"] selectedImage:[UIImage imageNamedWithOriginal:@"tabBar_new_click_icon"]];
//    friendTrend
    [self childViewController:[[SPFriendTrendViewController alloc] init] title:@"关注" normalImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageNamedWithOriginal:@"tabBar_friendTrends_click_icon"]];
//    me
    [self childViewController:[[SPHomeViewController alloc] init] title:@"我的" normalImage:[UIImage imageNamed:@"tabBar_me_icon"] selectedImage:[UIImage imageNamedWithOriginal:@"tabBar_me_click_icon"]];
}
-(void)childViewController:(UIViewController *)viewController title:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    viewController.title = title;
    viewController.tabBarItem.image = normalImage;
    viewController.tabBarItem.selectedImage = selectedImage;
    SPNavigationController *naVC = [[SPNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:naVC];
}
-(void)setUpTabBar{
    
}
@end
