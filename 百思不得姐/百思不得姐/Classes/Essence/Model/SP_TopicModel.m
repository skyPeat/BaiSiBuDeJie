//
//  SP_TopicModel.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/22.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "SP_TopicModel.h"
#import "SP_CommitModel.h"
@implementation SP_TopicModel
+(instancetype)topicModelWithDict:(NSDictionary *)dict{
    SP_TopicModel *topicModel = [[self alloc] init];
    [topicModel setValuesForKeysWithDictionary:dict];
    if (topicModel.top_cmt.count) {
        topicModel.hotCommit = [SP_CommitModel commitWithDict:topicModel.top_cmt.firstObject];
    }
    return topicModel;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
