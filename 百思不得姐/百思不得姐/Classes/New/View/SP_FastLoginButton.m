//
//  SP_FastLoginButton.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_FastLoginButton.h"

@implementation SP_FastLoginButton

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.SP_centerX = self.SP_width * 0.5;
    self.imageView.SP_y = 0;
    
    [self.titleLabel sizeToFit];
    self.titleLabel.SP_centerX = self.SP_width * 0.5;
    self.titleLabel.SP_y = self.SP_height - self.titleLabel.SP_height;
}
@end
