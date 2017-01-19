//
//  UIColor+SP_Color.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/19.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SP_Color)
//从十六进制字符串获取颜色
+(UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha;
//默认alpha为1
+(UIColor *)colorWithHexString:(NSString *)colorString;
//返回一个随机色
+(UIColor *)colorWithRandomColor;
@end
