//
//  UIBarButtonItem+SP_BarbuttonItem.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/19.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SP_BarbuttonItem)

/**
 设置导航条的按钮

 @param normalImageName normal状态下的图片
 @param highlightedImageName 高亮状态下的图片
 @param target 目标对象
 @param action 调用的方法
 @return 返回UIBarButtonIte
 */
+(UIBarButtonItem *)itemWithNormalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;
/**
 设置导航条的按钮
 
 @param normalImageName normal状态下的图片
 @param selectedImageName 选中状态下的图片
 @param target 目标对象
 @param action 调用的方法
 @return 返回UIBarButtonIte
 */
+(UIBarButtonItem *)itemWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action;
@end
