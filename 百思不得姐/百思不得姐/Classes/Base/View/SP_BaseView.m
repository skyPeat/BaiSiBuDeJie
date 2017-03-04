//
//  SP_BaseView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_BaseView.h"

@implementation SP_BaseView

+(instancetype)viewFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}
@end
