//
//  UITextField+SP_textField.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/25.
//  Copyright © 2016年 tianfeng pan. All rights reserved.
//

#import "UITextField+SP_textField.h"

@implementation UITextField (SP_textField)
//设置占位文字的颜色
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    if (self.placeholder == nil) {
        self.placeholder = @"";
    }
    UILabel *label = [self valueForKeyPath:@"placeholderLabel"];
    label.textColor = placeholderColor;
}
-(UIColor *)placeholderColor{
    return nil;
}
@end
