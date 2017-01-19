//
//  SP_ADModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/17.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_ADModel.h"

@implementation SP_ADModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    SP_ADModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
