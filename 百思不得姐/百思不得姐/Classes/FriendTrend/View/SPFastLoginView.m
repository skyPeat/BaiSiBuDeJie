//
//  SPFastLoginView.m
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/10.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import "SPFastLoginView.h"

@implementation SPFastLoginView

+(instancetype)fastLoginView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
