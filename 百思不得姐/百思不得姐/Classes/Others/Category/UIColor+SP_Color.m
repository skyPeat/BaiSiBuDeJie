//
//  UIColor+SP_Color.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/19.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import "UIColor+SP_Color.h"

@implementation UIColor (SP_Color)
+(UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha{
    //    0、删除字符串中的空字符
    NSString *colorStr = [[colorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if (colorStr.length < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([colorStr hasPrefix:@"0X"]) {
        colorStr = [colorStr substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([colorStr hasPrefix:@"#"]) {
        colorStr = [colorStr substringFromIndex:1];
    }
    //如果截取字符串长度不等于6,返回一个clearColor
    if (colorStr.length != 6) {
        return [UIColor clearColor];
    }
    // Separate into r, g, b substrings
    NSRange  range;
    range.location = 0;
    range.length = 2;
    //    r
    NSString *redString = [colorStr substringWithRange:range];
    //    g
    range.location = 2;
    NSString *greenString = [colorStr substringWithRange:range];
    //    b
    range.location = 4;
    NSString *blueString = [colorStr substringWithRange:range];
    //    Scan Values
    unsigned int r,g,b;
    [[NSScanner scannerWithString:redString] scanHexInt:&r];
    [[NSScanner scannerWithString:greenString] scanHexInt:&g];
    [[NSScanner scannerWithString:blueString] scanHexInt:&b];
    return [UIColor colorWithRed:((CGFloat)r/255.0f) green:((CGFloat)g/255.0f) blue:((CGFloat)b/255.0f) alpha:alpha];
}
+(UIColor *)colorWithHexString:(NSString *)colorString{
    return [self colorWithHexString:colorString alpha:1.0];
}
+(UIColor *)colorWithRandomColor{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
}
@end
