//
//  UIImage+Image.h
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/22.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
//返回一张没有背渲染的图片
+(UIImage *)imageNamedWithOriginal:(NSString *)imageName;
@end
