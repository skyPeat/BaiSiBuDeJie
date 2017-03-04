//
//  SP_FastLoginView.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_FastLoginView.h"

@implementation SP_FastLoginView

+(instancetype)fastLoginView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
