//
//  SP_BigPictureView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_BigPictureView.h"

@implementation SP_BigPictureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        button.backgroundColor = [UIColor greenColor];
        [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];

    }
    return self;
}
-(void)click{
    NSLog(@"yyyy");
}
@end
