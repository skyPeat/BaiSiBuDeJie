//
//  SP_UserModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_UserModel.h"

@implementation SP_UserModel
+(instancetype)userWithDict:(NSDictionary *)dict{
    SP_UserModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
