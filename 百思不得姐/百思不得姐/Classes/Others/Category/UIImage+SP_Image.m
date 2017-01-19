//
//  UIImage+SP_Image.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/19.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import "UIImage+SP_Image.h"

@implementation UIImage (SP_Image)
+(UIImage *)imageNamedWithRenderImageName:(NSString *)ImageName{
    UIImage *image = [UIImage imageNamed:ImageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
+(UIImage *)imageWithRoundCorner:(UIImage *)image{
    
//    0、开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//    1、设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.width)];
//    2、裁剪
    [path addClip];
//    3、绘制图片
    [image drawAtPoint:CGPointZero];
//    4、拿到新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    5、关闭上下文
    UIGraphicsEndImageContext();
//    6、返回一张圆角图片
    return newImage;
    
}
@end
