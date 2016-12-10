//
//  SPLoginRegisterViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/9.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPLoginRegisterViewController.h"
#import "SPLoginRegisterView.h"
#import "SPFastLoginView.h"
@interface SPLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginRegesterView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadConstraint;
@property (weak, nonatomic) IBOutlet UIView *fastLoginView;

@end

@implementation SPLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、添加登录注册界面
    [self  addLoginRegisterView];
//    1、添加快速登录模块
    [self addFastLoginView];
}
#pragma mark- 退出登录界面
- (IBAction)closeButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark- 切换登录注册
- (IBAction)registerClick:(UIButton *)sender {
    NSLog(@"%@",NSStringFromCGSize(self.loginRegesterView.frame.size));
    sender.selected = !sender.selected;
//    CGRect frame = self.loginRegesterView.frame;
//    frame.origin.x = frame.origin.x == 0? -SP_ScreenW : 0;
//    self.loginRegesterView.frame = frame;
    self.leadConstraint.constant = self.leadConstraint.constant == 0? -SP_ScreenW : 0;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}
#pragma mark- 添加登录注册界面
-(void)addLoginRegisterView{
//    添加登录界面
    SPLoginRegisterView *loginView = [SPLoginRegisterView loginView];
    [self.loginRegesterView addSubview:loginView];
//    添加注册界面
    SPLoginRegisterView *registerView = [SPLoginRegisterView registerView];
    [self.loginRegesterView addSubview:registerView];
}
#pragma mark- 布局登录注册界面
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    布局登录界面
    SPLoginRegisterView *loginView = self.loginRegesterView.subviews[0];
    loginView.frame = CGRectMake(0, 0, self.loginRegesterView.SP_width * 0.5, self.loginRegesterView.SP_height);
//    布局注册界面
    SPLoginRegisterView *registerView = self.loginRegesterView.subviews[1];
    registerView.frame = CGRectMake(self.loginRegesterView.SP_width * 0.5, 0, self.loginRegesterView.SP_width * 0.5, self.loginRegesterView.SP_height);
//    设置快速登录
    SPFastLoginView *fastLoginView = self.fastLoginView.subviews[0];
    fastLoginView.frame = self.fastLoginView.bounds;
}
#pragma mark- 添加快速登录模块
-(void)addFastLoginView{
    SPFastLoginView *fastLoginView = [SPFastLoginView fastLoginView];
    [self.fastLoginView addSubview:fastLoginView];
}
@end
