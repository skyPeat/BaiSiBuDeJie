//
//  SPNewViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPNewViewController.h"

@interface SPNewViewController ()

@end

@implementation SPNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor
    //    0、设置导航条的内容
    [self setUpNavigationBar];
}
#pragma mark-
#pragma mark- 设置导航条的内容
-(void)setUpNavigationBar{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightedImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(subTagClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
-(void)subTagClick{
    NSLog(@"%s",__func__);
}
@end
