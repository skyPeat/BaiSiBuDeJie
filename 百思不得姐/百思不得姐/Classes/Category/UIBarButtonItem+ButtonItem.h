//
//  UIBarButtonItem+ButtonItem.h
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/23.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ButtonItem)
+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage target:(id)target action:(SEL)action;

+(UIBarButtonItem *)itemWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action;
@end
