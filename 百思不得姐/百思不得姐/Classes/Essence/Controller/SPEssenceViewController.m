//
//  SPEssenceViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPEssenceViewController.h"
#import "SPAllViewController.h"
#import "SPVideoViewController.h"
#import "SPVoiceViewController.h"
#import "SPTextViewController.h"
#import "SPPictureViewController.h"
static NSString * const ID = @"cell";
@interface SPEssenceViewController ()

@end

@implementation SPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    0、设置导航条的内容
    [self setUpNavigationbar];
    
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
    //    right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"navigationButtonRandom" selectedImageName:@"navigationButtonRandomClick" target:self action:@selector(randomClick)];
    //    titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)randomClick{
    
}
#pragma mark- 添加子控制器
-(void)addChildViewControllers{
    //    allVC
    SPAllViewController *allVC = [[SPAllViewController alloc] init];
    allVC.title = @"全部";
    [self addChildViewController:allVC];
    //    videoVC
    SPVideoViewController *videoVC = [[SPVideoViewController alloc] init];
    videoVC.title = @"视频";
    [self addChildViewController:videoVC];
    //    pictureVC
    SPPictureViewController *pictureVC = [[SPPictureViewController alloc] init];
    pictureVC.title = @"图片";
    [self addChildViewController:pictureVC];
    //    textVC
    SPTextViewController *textVC = [[SPTextViewController alloc] init];
    textVC.title = @"段子";
    [self addChildViewController:textVC];
    //    voiceVC
    SPVoiceViewController *voiceVC = [[SPVoiceViewController alloc] init];
    voiceVC.title = @"声音";
    [self addChildViewController:voiceVC];
}
@end
