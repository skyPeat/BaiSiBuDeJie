//
//  SPEssenceViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//
#import "SPEssenceViewController.h"
#import "SPAllViewController.h"
#import "SPVideosViewController.h"
#import "SPVoiceViewController.h"
#import "SPPicturesViewController.h"
#import "SPTextViewController.h"
@interface SPEssenceViewController ()




@end
@implementation SPEssenceViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //    0、设置导航条的内容
    [self setUpNavigationBar];   
}
#pragma mark-
#pragma mark- 设置导航条的内容
-(void)setUpNavigationBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"nav_item_game_icon"] highlightedImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(gameClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"navigationButtonRandom"] highlightedImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(random)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)setUpChildViewControllers{
    NSArray *titleArray = @[@"全部",@"视频",@"声音",@"图片",@"段子",@"网红",@"美女",@"冷知识",@"游戏"];
    
    SPAllViewController *allVC = [[SPAllViewController alloc] init];
    allVC.title = titleArray[self.childViewControllers.count];
    [self addChildViewController:allVC];
    
    SPVideosViewController *videoVC = [[SPVideosViewController alloc] init];
    videoVC.title = titleArray[self.childViewControllers.count];
    [self addChildViewController:videoVC];
    
    SPVoiceViewController *voiceVC = [[SPVoiceViewController alloc] init];
    voiceVC.title = titleArray[self.childViewControllers.count];
    [self addChildViewController:voiceVC];
    
    SPPicturesViewController *pictureVC = [[SPPicturesViewController alloc] init];
    pictureVC.title = titleArray[self.childViewControllers.count];
    [self addChildViewController:pictureVC];
    
    SPTextViewController *textVC = [[SPTextViewController alloc] init];
    textVC.title = titleArray[self.childViewControllers.count];
    [self addChildViewController:textVC];
}

-(void)gameClick{
    NSLog(@"%s",__func__);
}
-(void)random{
    NSLog(@"%s",__func__);
}

@end