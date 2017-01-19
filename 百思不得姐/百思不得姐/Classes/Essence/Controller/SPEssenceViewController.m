//
//  SPEssenceViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPEssenceViewController.h"

@interface SPEssenceViewController ()

@end

@implementation SPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、设置导航条的内容
    [self setUpNavigationbar];
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
//    left
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"cup-Icon-click" selectedImageName:@"cup-Icon-click" target:self action:@selector(cupClick)];
//    right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"navigationButtonRandom" selectedImageName:@"navigationButtonRandomClick" target:self action:@selector(randomClick)];
//  titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)cupClick{
    
}
-(void)randomClick{
    
}
@end
