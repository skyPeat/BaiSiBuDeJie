//
//  SPDiscoverViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPFriendTrendViewController.h"

@interface SPFriendTrendViewController ()

@end

@implementation SPFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = randomColor
    //    0、设置导航条的内容
    [self setUpNavigationBar];
    
}
#pragma mark-
#pragma mark- 设置导航条的内容
-(void)setUpNavigationBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightedImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(reconmmemtIconClick)];
    self.navigationItem.title = @"我的关注";
}
-(void)reconmmemtIconClick{
    SP_Log(@"%s",__func__)
}
@end
