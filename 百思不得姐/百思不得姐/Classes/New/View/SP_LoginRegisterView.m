//
//  SP_LoginRegisterView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_LoginRegisterView.h"
@interface SP_LoginRegisterView ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@end
@implementation SP_LoginRegisterView

+(instancetype)loginView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
+(instancetype)registerView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}
- (IBAction)loginBtn:(UIButton *)sender {
}
- (IBAction)forgetPswBtn:(UIButton *)sender {
}
- (IBAction)registerBtn:(UIButton *)sender {
}
-(void)awakeFromNib{
    [super awakeFromNib];
    UIImage *image1 = self.loginButton.currentBackgroundImage;
    image1 = [image1 stretchableImageWithLeftCapWidth:image1.size.width * 0.5 topCapHeight:image1.size.height * 0.5];
    [self.loginButton setBackgroundImage:image1 forState:UIControlStateNormal];
    
    UIImage *image2 = self.registerButton.currentBackgroundImage;
    image2 = [image2 stretchableImageWithLeftCapWidth:image2.size.width * 0.5 topCapHeight:image2.size.height * 0.5];
    [self.registerButton setBackgroundImage:image2 forState:UIControlStateNormal];
}


@end
