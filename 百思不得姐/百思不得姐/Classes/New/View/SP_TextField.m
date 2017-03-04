//
//  SP_TextField.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_TextField.h"

@implementation SP_TextField

-(void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    
}

-(BOOL)becomeFirstResponder{
    self.placeholderColor = [UIColor whiteColor];
    return [super becomeFirstResponder];
}
-(BOOL)resignFirstResponder{
    self.placeholderColor = [UIColor lightGrayColor];
    return [super resignFirstResponder];
}


@end
