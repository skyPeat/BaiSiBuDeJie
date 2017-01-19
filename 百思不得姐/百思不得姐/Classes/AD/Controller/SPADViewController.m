//
//  SPADViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/17.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPADViewController.h"
#import "SP_ADModel.h"
#import "SPTabBarController.h"
#import <UIImageView+WebCache.h>
#define iPhone6P  SP_ScreenH == 736
#define iPhone6   SP_ScreenH == 667
#define iPhone5   SP_ScreenH == 568
#define iPhone4   SP_ScreenH == 480
#define SP_code @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
#import <AFNetworking.h>
@interface SPADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
@property(nonatomic,weak) UIImageView *imageView;
@property(nonatomic,strong) SP_ADModel *model;
@property(nonatomic,weak) NSTimer *timer;
@end

@implementation SPADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、适配启动图片
    [self setUpLaunchImageView];
//    1、请求数据
    [self loadData];
//    3、设置定时跳转
    [self setUpTimer];
}
#pragma mark- 适配启动图片
-(void)setUpLaunchImageView{
    UIImage *image = nil;
    if (iPhone4) {
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    }else if (iPhone5){
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iPhone6){
        image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }else if (iPhone6P){
        image = [UIImage imageNamed:@"LaunchImage"];
    }
    self.launchImageView.image = image;
}
#pragma mark- 请求数据
-(void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager SP_manager];
    NSDictionary *parameter = @{@"code2":SP_code};
    [manager SP_GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameter progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dataDict = [responseObject[@"ad"] firstObject];
        self.model = [SP_ADModel modelWithDict:dataDict];
        if (self.model.w <= 0) return ;
        CGFloat iconW = SP_ScreenW;
        CGFloat iconH = SP_ScreenW / self.model.w * self.model.h;
        self.imageView.frame = CGRectMake(0, 0, iconW, iconH);
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.model.w_picurl]];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
}
#pragma mark- 处理广告界面的业务逻辑
-(UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
        [self.contentView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
    }
    return _imageView;
}
-(void)tap{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:[NSURL URLWithString:self.model.ori_curl]]) {
        [app openURL:[NSURL URLWithString:self.model.ori_curl]];
    }
}
#pragma mark- 设置定时跳转
-(void)setUpTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}
-(void)timeChange{
    static int i = 3;
    if (i <= 1) {
        [self jumpButton:nil];
    }
    i--;
    NSString *str = [NSString stringWithFormat:@"跳转(%d)",i];
    [self.jumpButton setTitle:str forState:UIControlStateNormal];
}
- (IBAction)jumpButton:(UIButton *)sender {
    [UIApplication sharedApplication].keyWindow.rootViewController = [[SPTabBarController alloc] init];
//    关闭定时器
    [self.timer invalidate];
}

@end
