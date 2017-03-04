//
//  SP_SquareModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_SquareModel.h"

@implementation SP_SquareModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    SP_SquareModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
