//
//  UIView+Frame.m
//  百思不得姐
//
//  Created by 潘天峰 on 16/11/22.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(void)setSP_x:(CGFloat)SP_x{
    CGRect frame = self.frame;
    frame.origin.x = SP_x;
    self.frame = frame;
}
-(CGFloat)SP_x{
    return self.frame.origin.x;
}

-(void)setSP_y:(CGFloat)SP_y{
    CGRect frame = self.frame;
    frame.origin.y = SP_y;
    self.frame = frame;
}
-(CGFloat)SP_y{
    return self.frame.origin.y;
}

-(void)setSP_width:(CGFloat)SP_width{
    CGRect frame = self.frame;
    frame.size.width = SP_width;
    self.frame = frame;
}
-(CGFloat)SP_width{
    return self.frame.size.width;
}

-(void)setSP_height:(CGFloat)SP_height{
    CGRect frame = self.frame;
    frame.size.height = SP_height;
    self.frame = frame;
}
-(CGFloat)SP_height{
    return self.frame.size.height;
}

- (void)setSP_centerX:(CGFloat)SP_centerX
{
    CGPoint center = self.center;
    center.x = SP_centerX;
    self.center = center;
}
- (CGFloat)SP_centerX
{
    return self.center.x;
}

- (void)setSP_centerY:(CGFloat)SP_centerY
{
    CGPoint center = self.center;
    center.y = SP_centerY;
    self.center = center;
}
- (CGFloat)SP_centerY
{
    return self.center.y;
}

-(void)setSP_center:(CGPoint)SP_center{
    CGRect bounds = self.bounds;
    bounds.origin.x = SP_center.x - bounds.size.width / 2.0;
    bounds.origin.y = SP_center.y - bounds.size.height / 2.0;
    self.bounds = bounds;
}
-(CGPoint)SP_center{
    return CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}
@end
