//
//  SP_SubTagModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/19.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SP_SubTagModel : NSObject
@property(nonatomic,strong) NSString *image_list;
@property(nonatomic,strong) NSString *sub_number;
@property(nonatomic,strong) NSString *theme_name;
+(instancetype)subTagModelWithDict:(NSDictionary *)dict;
@end
