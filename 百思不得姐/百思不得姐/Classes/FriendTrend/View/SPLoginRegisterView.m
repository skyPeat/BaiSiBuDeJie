//
//  SPLoginRegisterView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/9.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPLoginRegisterView.h"
@interface SPLoginRegisterView ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end
@implementation SPLoginRegisterView
#pragma mark- 返回一个登录的界面
+(instancetype)loginView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
#pragma mark- 返回一个注册的界面
+(instancetype)registerView{
        return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
#pragma mark-  处理图片拉伸问题
-(void)awakeFromNib{
    UIImage *loginImage = self.loginButton.currentBackgroundImage;
    loginImage = [loginImage stretchableImageWithLeftCapWidth:loginImage.size.width * 0.5 topCapHeight:loginImage.size.height * 0.5];
    [self.loginButton setBackgroundImage:loginImage forState:UIControlStateNormal];
    
    UIImage *registerImage = self.registerButton.currentBackgroundImage;
    registerImage = [registerImage stretchableImageWithLeftCapWidth:registerImage.size.width * 0.5 topCapHeight:registerImage.size.height * 0.5];
    [self.registerButton setBackgroundImage:registerImage forState:UIControlStateNormal];
}

@end
