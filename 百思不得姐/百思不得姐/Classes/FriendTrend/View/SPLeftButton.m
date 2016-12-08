//
//  SPLeftButton.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/7.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPLeftButton.h"

@implementation SPLeftButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
//        设置按钮文字的大小
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        

//        设置按钮不同状态的文字的颜色
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
            }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
