//
//  SPHomeViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPMineViewController.h"
#import "SPSettingViewController.h"
@interface SPMineViewController ()

@end

@implementation SPMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    0、设置导航条的内容
    [self setUpNavigationbar];
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
    //    left
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"hongbao-icon" selectedImageName:@"hongbao-icon" target:self action:@selector(hongbaoClick)];
    //    right
    UIBarButtonItem *nightButton = [UIBarButtonItem itemWithNormalImageName:@"mine-moon-icon" selectedImageName:@"mine-moon-icon-click" target:self action:@selector(nightClick:)];
    UIBarButtonItem *settingButton = [UIBarButtonItem itemWithNormalImageName:@"mine-setting-icon" selectedImageName:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[settingButton,nightButton];
    //  titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)hongbaoClick{
    
}
-(void)nightClick:(UIButton *)button{
    button.selected = !button.selected;
}
-(void)settingClick{
    [self.navigationController pushViewController:[[SPSettingViewController alloc] init] animated:YES];
}
@end
