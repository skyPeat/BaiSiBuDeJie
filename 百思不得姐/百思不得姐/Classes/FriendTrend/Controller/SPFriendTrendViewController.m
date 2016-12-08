//
//  SPDiscoverViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/21.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPFriendTrendViewController.h"
#import "SPRecommendViewController.h"
@interface SPFriendTrendViewController ()
@property (weak, nonatomic) IBOutlet UIView *centerView;

@end

@implementation SPFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCenterView];
    //    0、设置导航条的内容
    [self setUpNavigationBar];
    
}
#pragma mark-
#pragma mark- 设置导航条的内容
-(void)setUpNavigationBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithNormalImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightedImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(reconmmemtIconClick)];
    self.navigationItem.title = @"关注";
}
-(void)reconmmemtIconClick{
//    跳转到推荐关注界面
    SPRecommendViewController *recommenVC = [[SPRecommendViewController alloc] init];
//    跳转之前隐藏底部条
    recommenVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recommenVC animated:YES];
}
-(void)setCenterView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = self.centerView.bounds;
    imageView.image = [UIImage imageNamed:@"liumenli"];
    [self.centerView addSubview:imageView];
}
@end
