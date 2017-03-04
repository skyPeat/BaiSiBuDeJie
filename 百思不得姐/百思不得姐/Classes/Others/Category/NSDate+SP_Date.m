//
//  NSDate+SP_Date.m
//  百思不得姐
//
//  Created by tianfeng pan on 17/3/4.
//  Copyright © 2017年 tianfeng pan. All rights reserved.
//

#import "NSDate+SP_Date.h"

@implementation NSDate (SP_Date)
-(BOOL)isThisYear{
    // 实例一个日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    NSDateComponents *creatCom = [calendar components:NSCalendarUnitYear fromDate:self];
    return component.year == creatCom.year;
}
-(BOOL)isToday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar isDateInToday:self];
}
-(BOOL)isYesterday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar isDateInYesterday:self];
}
-(NSDateComponents *)dealTime{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
}
@end
