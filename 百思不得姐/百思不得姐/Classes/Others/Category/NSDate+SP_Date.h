//
//  NSDate+SP_Date.h
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SP_Date)
-(BOOL)isThisYear;
-(BOOL)isToday;
-(BOOL)isYesterday;
-(NSDateComponents *)dealTime;
@end
