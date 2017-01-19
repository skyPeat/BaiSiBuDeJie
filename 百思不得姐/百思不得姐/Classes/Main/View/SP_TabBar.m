//
//  SP_TabBar.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/12.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_TabBar.h"
#import "SPPublishViewController.h"
@interface SP_TabBar ()
@property(nonatomic,weak) UIButton *publishButton;
@end
@implementation SP_TabBar
#pragma mark- 懒加载发布按钮
-(UIButton *)publishButton{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamedWithRenderImageName:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton sizeToFit];
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}
-(void)publishButtonClick{
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[SPPublishViewController alloc] init] animated:YES completion:nil];
}
#pragma mark- 布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.items.count + 1;
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.SP_width / count;
    CGFloat buttonH = self.SP_height;
    int i = 0;
    for (UIView *buttonView in self.subviews) {
        if ([buttonView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            buttonX = buttonW * i;
            buttonView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            i++;
        }
    }
    self.publishButton.center = self.SP_center;
}
@end
