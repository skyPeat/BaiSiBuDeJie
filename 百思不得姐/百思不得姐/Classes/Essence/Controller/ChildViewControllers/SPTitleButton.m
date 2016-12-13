
//
//  SPTitleButton.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/11.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPTitleButton.h"

@implementation SPTitleButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        设置按钮文字的大小
        self.titleLabel.font = [UIFont systemFontOfSize:15];
//        设置文字的颜色
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}
//重写highlighted方法，不让按钮显示高亮状态
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
