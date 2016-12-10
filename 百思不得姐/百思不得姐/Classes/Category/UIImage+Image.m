//
//  UIImage+Image.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/22.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+(UIImage *)imageNamedWithOriginal:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
+(UIImage *)roundImage:(UIImage *)image placeholderImage:(UIImage *)placeholderImage{
//    //        判断是否有图片
//    if (image == nil) {
//        image = placeholderImage;
//    }
    //        开启位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //        设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.width)];
    //        裁剪
    [path addClip];
    //        绘制图片
    [image drawAtPoint:CGPointZero];
    //        拿到新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //        关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}

@end
