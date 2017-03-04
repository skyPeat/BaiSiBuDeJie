//
//  SP_SubTagModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/19.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_SubTagModel.h"

@implementation SP_SubTagModel
+(instancetype)subTagModelWithDict:(NSDictionary *)dict{
    SP_SubTagModel *model = [[SP_SubTagModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
