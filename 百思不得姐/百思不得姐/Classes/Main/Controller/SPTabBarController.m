//
//  SPTabBarController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPTabBarController.h"
#import "SPNavigationController.h"
#import "SPEssenceViewController.h"
#import "SPNewViewController.h"
#import "SPFriendTrendViewController.h"
#import "SPMineViewController.h"
#import "SP_TabBar.h"
@interface SPTabBarController ()

@end

@implementation SPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、添加子控制器
    [self setUpChildViewControllers];
//    1、自定义tabBar
    [self setUpTabBar];
    
}
#pragma mark- 添加子控制器
-(void)setUpChildViewControllers{
//    0、essence(精华)
    [self childViewController:[[SPEssenceViewController alloc] init] title:@"精华" normalImageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
//    1、new(新帖)
    [self childViewController:[[SPNewViewController alloc] init] title:@"新帖" normalImageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"];
//    2、friendTrend(关注)
    [self childViewController:[[SPFriendTrendViewController alloc] init] title:@"关注" normalImageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon"];
//    3、mine(我的)
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"SPMineViewController" bundle:nil];
    [self childViewController:[storyBoard instantiateViewControllerWithIdentifier:@"SPMineViewController"] title:@"我的" normalImageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"];
}
#pragma mark- 初始化子控制器
-(void)childViewController:(UIViewController *)viewController title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName{
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:normalImageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamedWithRenderImageName:selectedImageName];
    SPNavigationController *nav = [[SPNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
}
#pragma mark- 处理文字不备渲染
+(void)load{
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    NSDictionary *sizeAttri = @{NSFontAttributeName :  [UIFont systemFontOfSize:13]};
    [tabBarItem setTitleTextAttributes:sizeAttri forState:UIControlStateNormal];
    NSDictionary *colorAttri = @{NSForegroundColorAttributeName :  [UIColor blackColor]};
    [tabBarItem setTitleTextAttributes:colorAttri forState:UIControlStateSelected];
}
-(void)setUpTabBar{
    [self setValue:[[SP_TabBar alloc] init] forKey:@"tabBar"];
}
@end
