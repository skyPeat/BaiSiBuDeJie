//
//  SP_CommitModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_CommitModel.h"
#import "SP_UserModel.h"
@implementation SP_CommitModel
+(instancetype)commitWithDict:(NSDictionary *)dict{
    SP_CommitModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    model.userModel = [SP_UserModel userWithDict:model.user];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
