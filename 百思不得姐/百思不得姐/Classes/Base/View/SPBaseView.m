//
//  SPBaseView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/15.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPBaseView.h"

@implementation SPBaseView
+(instancetype)viewFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
