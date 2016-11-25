//
//  SPEssenceViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPEssenceViewController.h"

@interface SPEssenceViewController ()

@end

@implementation SPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor
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
-(void)gameClick{
    NSLog(@"%s",__func__);
}
-(void)random{
    NSLog(@"%s",__func__);
}
@end
