//
//  SP_SquareModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/2/5.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SP_SquareModel : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *icon;
@property (nonatomic, strong) NSString *url;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
