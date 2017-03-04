//
//  NSString+SP_String.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/25.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "NSString+SP_String.h"

@implementation NSString (SP_String)
-(NSURL *)SP_UrlString{
    return [NSURL URLWithString:self];
}
@end
