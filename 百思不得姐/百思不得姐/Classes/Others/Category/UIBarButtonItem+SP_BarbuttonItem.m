//
//  UIBarButtonItem+SP_BarbuttonItem.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/19.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import "UIBarButtonItem+SP_BarbuttonItem.h"

@implementation UIBarButtonItem (SP_BarbuttonItem)
+(UIBarButtonItem *)itemWithNormalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *buttonView = [[UIView alloc] initWithFrame:button.bounds];
    [buttonView addSubview:button];
    return  [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}
+(UIBarButtonItem *)itemWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *buttonView = [[UIView alloc] initWithFrame:button.bounds];
    [buttonView addSubview:button];
    return  [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}
@end
