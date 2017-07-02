//
//  NSDate+YB.m
//  SWWH
//
//  Created by 尚往文化 on 16/7/20.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NSDate+YB.h"

@implementation NSDate (YB)

+ (NSString *)stringWithTimeInterval:(NSInteger)timeInterval
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval/1000];
    return [formatter stringFromDate:date];
}

+ (NSString *)dateStringWithDate:(NSDate *)date
{
    return [self dateStringWithDate:date dateFormat:@"yyyy-MM-dd"];
}

+ (NSString *)dateStringWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

@end
