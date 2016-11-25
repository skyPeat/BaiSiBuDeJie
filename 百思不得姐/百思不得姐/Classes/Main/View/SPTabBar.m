//
//  SPTabBar.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/22.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPTabBar.h"
#import "SPPublishViewController.h"
@interface SPTabBar ()
@property(nonatomic,weak) UIButton *publishButton;

@end
@implementation SPTabBar
-(UIButton *)publishButton{
    if (_publishButton == nil) {
       UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamedWithOriginal:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [button sizeToFit];
        [button addTarget:self action:@selector(modalVC) forControlEvents:UIControlEventTouchUpInside];
        _publishButton = button;
        [self addSubview:button];
    }
    return _publishButton;
}
-(void)modalVC{
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[SPPublishViewController alloc] init] animated:YES completion:^{
        
    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.items.count + 1;
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.SP_width / count;
    CGFloat buttonH = self.SP_height;
    int i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            buttonX = i * buttonW;
            tabBarButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            i++;
        }
    }
    self.publishButton.center = self.SP_center;
//    self.publishButton.center = CGPointMake(self.SP_width * 0.5, self.SP_height * 0.5);
}
@end
