//
//  SPADViewController.m
//  百思不得姐
//
//  Created by 潘天峰 on 2016/12/4.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPADViewController.h"
#import "SPADItem.h"
#import "AFNetworking.h"
#import <MJExtension/MJExtension.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "SPTabBarController.h"
#define iPhone4 (SP_ScreenH == 480)
#define iPhone5 (SP_ScreenH == 568)
#define iPhone6 (SP_ScreenH == 667)
#define iPhone6P (SP_ScreenH == 736)
#define code @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface SPADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *luanchImageView;
@property (weak, nonatomic) IBOutlet UIView *ADVeiw;
@property(nonatomic,weak) UIImageView *adImageVeiw;
@property (weak, nonatomic) IBOutlet UIButton *jumpButton;
@property(nonatomic,strong) SPADItem *item;
@property(nonatomic,weak) NSTimer *timmer;
@end

@implementation SPADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、设置启动图片
    [self setUpLuanchImage];
//    1、加载广告数据
    [self loadADData];
//    2、处理广告界面跳转逻辑
//    创建定时器
    _timmer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}
#pragma mark-
#pragma mark- 屏幕适配
-(void)setUpLuanchImage{
    UIImage *luanchImage = nil;
//    屏幕适配
    if (iPhone4) {
       luanchImage = [UIImage imageNamed:@"LaunchImage"];
    }else if (iPhone5){
        luanchImage = [UIImage imageNamed:@"LaunchImage-568h"];
    }else if (iPhone6){
        luanchImage = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iPhone6P){
        luanchImage = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    _luanchImageView.image = luanchImage;
}
-(UIImageView *)adImageVeiw{
    if (_adImageVeiw == nil) {
        UIImageView *adImageView = [[UIImageView alloc] init];
        _adImageVeiw = adImageView;
        [self.ADVeiw addSubview:adImageView];
#pragma mark-
#pragma mark- 处理广告界面跳转逻辑
        adImageView.userInteractionEnabled = YES;
//        添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [adImageView addGestureRecognizer:tap];
    }
    return _adImageVeiw;
}
-(void)tap{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:[NSURL URLWithString:self.item.ori_curl]]) {
        [app openURL:[NSURL URLWithString:self.item.ori_curl]];
    }
}
- (IBAction)jumpButtonClick:(UIButton *)sender {
    [UIApplication sharedApplication].keyWindow.rootViewController = [[SPTabBarController alloc] init];
    [self.timmer invalidate];
}
-(void)timeChange{
    static int i = 3;
    if (i <= 0) {
        [self jumpButtonClick:nil];
        
    }
    i--;
//    设置按钮标题
    NSString *btnStr = [NSString stringWithFormat:@"跳转(%d)",i];
    self.jumpButton.titleLabel.text = btnStr;
}
#pragma mark-
#pragma mark- 加载广告数据
-(void)loadADData{
//    0、创建会话管理者
    AFHTTPSessionManager *maneger = [AFHTTPSessionManager manager];
//    1、创建数组字典
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"code2"] = code;
//    2、发送GET请求数据
    [maneger GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        获取广告数据
        NSDictionary *dict = [responseObject[@"ad"] firstObject];
//        字典数组转模型数组
        SPADItem *item = [SPADItem mj_objectWithKeyValues:dict];
        self.item = item;
//        设置数据,展示界面
        CGFloat w = SP_ScreenW;
        CGFloat h = SP_ScreenW / item.w * item.h;
        self.adImageVeiw.frame = CGRectMake(0, 0, w, h);
        self.adImageVeiw.contentMode = UIViewContentModeScaleAspectFit;
        [self.adImageVeiw sd_setImageWithURL:[NSURL URLWithString:item.w_picurl] placeholderImage:[UIImage imageNamed:@"lml"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
