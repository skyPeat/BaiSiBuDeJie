//
//  SPSettingViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/23.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPSettingViewController.h"
@interface SPSettingViewController ()

@end
@implementation SPSettingViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = randomColor
    //    0、设置导航条的内容
    [self setUpNavigationBar];
    
}
-(void)setUpNavigationBar{
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popVC)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStyleDone target:self action:@selector(jump)];
    
    self.navigationItem.title = @"设置";
}
-(void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)jump{
    UIViewController *testVC = [[UIViewController alloc] init];
    testVC.view.backgroundColor = randomColor
    [self.navigationController pushViewController:testVC animated:YES];
}
@end
