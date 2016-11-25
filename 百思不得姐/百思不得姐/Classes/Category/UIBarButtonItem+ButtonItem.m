//
//  UIBarButtonItem+ButtonItem.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/23.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "UIBarButtonItem+ButtonItem.h"

@implementation UIBarButtonItem (ButtonItem)
+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *buttonView = [[UIView alloc] initWithFrame:button.bounds];
    [buttonView addSubview:button];
    return  [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}
+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *buttonView = [[UIView alloc] initWithFrame:button.bounds];
    [buttonView addSubview:button];
    return  [[UIBarButtonItem alloc] initWithCustomView:buttonView];
}

@end
