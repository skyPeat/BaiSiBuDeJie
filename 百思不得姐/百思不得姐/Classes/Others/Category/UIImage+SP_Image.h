//
//  UIImage+SP_Image.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/19.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SP_Image)

/**
 返回一张原始图片

 @param ImageName 图片的名字
 @return 返回一张渲染好的图片
 */
+(UIImage *)imageNamedWithRenderImageName:(NSString *)ImageName;

/**
 返回一张圆角图片

 @param image 要处理的图片
 @return 返回一张圆角图片
 */
+(UIImage *)imageWithRoundCorner:(UIImage *)image;
@end
