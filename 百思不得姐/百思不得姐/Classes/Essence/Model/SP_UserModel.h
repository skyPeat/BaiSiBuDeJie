//
//  SP_UserModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SP_UserModel : NSObject
@property(nonatomic,strong) NSString *username;
@property(nonatomic,assign) NSInteger total_cmt_like_count;
+(instancetype)userWithDict:(NSDictionary *)dict;

@end
