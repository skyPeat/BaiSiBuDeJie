//
//  SPFriendTrendViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPFriendTrendViewController.h"
#import "SPSubTagViewController.h"
@interface SPFriendTrendViewController ()

@end

@implementation SPFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    0、设置导航条的内容
    [self setUpNavigationbar];
}
#pragma mark- 设置导航条的内容
-(void)setUpNavigationbar{
    //    left
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"friendsRecommentIcon" selectedImageName:@"friendsRecommentIcon-click" target:self action:@selector(subTagClick)];
    //    right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithNormalImageName:@"search-icon" selectedImageName:@"search-icon" target:self action:@selector(searchClick)];
    //  titleView
    self.navigationItem.title = @"关注";
}
-(void)subTagClick{
    [self.navigationController pushViewController:[[SPSubTagViewController alloc] init] animated:YES];
}
-(void)searchClick{
    
}
- (IBAction)loginRegisterButtonClick:(UIButton *)sender {
}

@end
