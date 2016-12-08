//
//  SPSubscribItem.h
//  百思不得姐
//
//  Created by tianfeng pan on 16/12/7.
//  Copyright © 2016年 skyPeat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPSubscribItem : NSObject
//昵称
@property(nonatomic,strong)NSString *screen_name;
//头像地址
@property(nonatomic,strong)NSString *header;
//关注人数
@property(nonatomic,strong)NSString *fans_count;
//是否VIP
@property(nonatomic,assign,getter=isVIP)BOOL isVip;
@end
