//
//  SP_ADModel.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/1/17.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SP_ADModel : NSObject
@property(nonatomic,strong) NSString *w_picurl;
@property(nonatomic,strong) NSString *ori_curl;
@property(nonatomic,assign) CGFloat h;
@property(nonatomic,assign) CGFloat w;
+(instancetype)modelWithDict:(NSDictionary *)dict;
@end
