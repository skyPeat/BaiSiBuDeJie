//
//  SP_CommitModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SP_UserModel;
@interface SP_CommitModel : NSObject
@property(nonatomic,strong) NSDictionary *user;
@property(nonatomic,strong) NSString *voiceuri;
@property(nonatomic,assign) NSInteger cmt_type;
@property(nonatomic,strong) NSString *content;
@property(nonatomic,strong) NSString *voicetime;
@property(nonatomic,strong) SP_UserModel *userModel;
+(instancetype)commitWithDict:(NSDictionary *)dict;
@end
