//
//  SPHomeViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPHomeViewController.h"
#import "SPSettingViewController.h"
@interface SPHomeViewController ()

@end

@implementation SPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor
    //    0、设置导航条的内容
    [self setUpNavigationBar];
    
}
#pragma mark-
#pragma mark- 设置导航条的内容
-(void)setUpNavigationBar{
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moonIconClick:)];
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"mine-setting-icon"] highlightedImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    self.navigationItem.title = @"我的";
}
-(void)moonIconClick:(UIButton *)moonButton{
    moonButton.selected = !moonButton.selected;
}
-(void)settingClick{
    SPSettingViewController *settingVC = [[SPSettingViewController alloc] init];
//    跳转之前隐藏底部条
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}
@end
