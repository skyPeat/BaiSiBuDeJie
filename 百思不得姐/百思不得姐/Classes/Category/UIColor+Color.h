//
//  UIColor+Color.h
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/22.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SP_Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
@interface UIColor (Color)
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+(UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha;
// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)colorStr;
//返回一个随机色
+(UIColor *)colorWithRandomColor;
@end
