//
//  SPNewViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPNewViewController.h"
#import "SPLoginRegisterViewController.h"
@interface SPNewViewController ()

@end

@implementation SPNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    0、设置导航条的内容
    [self setUpNavigationbar];
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
    //    right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"shen-icon" selectedImageName:@"shen-icon" target:self action:@selector(shenClick)];
    //  titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)shenClick{
    SPLoginRegisterViewController *loginRegisterVC = [[SPLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegisterVC animated:YES completion:nil];
}

@end
