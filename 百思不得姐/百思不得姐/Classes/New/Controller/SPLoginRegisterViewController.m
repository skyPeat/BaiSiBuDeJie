//
//  SPLoginRegisterViewController.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SPLoginRegisterViewController.h"
#import "SP_LoginRegisterView.h"
#import "SP_FastLoginView.h"
@interface SPLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingCols;


@end

@implementation SPLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    0、添加子控件
    [self addChildViews];
    
    
}
- (IBAction)closeButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.leadingCols.constant = self.leadingCols.constant == 0?-SP_ScreenW:0;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}
#pragma mark- 添加添加子控件
-(void)addChildViews{
//    loginView
    SP_LoginRegisterView *loginView = [SP_LoginRegisterView loginView];
    [self.middleView addSubview:loginView];
//    registerView
    SP_LoginRegisterView *registerView = [SP_LoginRegisterView registerView];
    [self.middleView addSubview:registerView];
//    fastLoginView
    SP_FastLoginView *fastLoginView = [SP_FastLoginView fastLoginView];
    [self.bottomView addSubview:fastLoginView];
}
#pragma mark- 布局子控件
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
//    loginView
    SP_LoginRegisterView *loginView = self.middleView.subviews[0];
    loginView.frame = CGRectMake(0, 100, self.middleView.SP_width * 0.5, self.middleView.SP_height);
//    registerView
    SP_LoginRegisterView *registerView = self.middleView.subviews[1];
    registerView.frame = CGRectMake(self.middleView.SP_width * 0.5, 100, self.middleView.SP_width * 0.5, self.middleView.SP_height);
    //    fastLoginView
    SP_FastLoginView *fastLoginView = self.bottomView.subviews[0];
    fastLoginView.frame = self.bottomView.bounds;
}
@end
