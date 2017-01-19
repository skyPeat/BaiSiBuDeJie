//
//  SPNewViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPNewViewController.h"

@interface SPNewViewController ()

@end

@implementation SPNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SP_RandomColor
    //    0、设置导航条的内容
    [self setUpNavigationbar];
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
    //    left
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"MainTagSubIcon" selectedImageName:@"MainTagSubIconClick" target:self action:@selector(subClick)];
    //    right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"search-icon" selectedImageName:@"search-icon" target:self action:@selector(searchClick)];
    //  titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)subClick{
    
}
-(void)searchClick{
    
}
@end
