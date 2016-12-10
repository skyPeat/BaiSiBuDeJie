//
//  SPFastLoginButton.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/10.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPFastLoginButton.h"

@implementation SPFastLoginButton

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.SP_centerX = self.SP_width * 0.5;
    self.imageView.SP_y = 0;
    
    [self.titleLabel sizeToFit];
    self.titleLabel.SP_centerX = self.SP_width * 0.5;
    self.titleLabel.SP_y = self.SP_height - self.titleLabel.SP_height;
}
@end
