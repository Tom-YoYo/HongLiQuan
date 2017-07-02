//
//  NSDate+YB.h
//  SWWH
//
//  Created by 尚往文化 on 16/7/20.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YB)

/**
 *  根据时间戳返回时间字符串
 */
+ (NSString *)stringWithTimeInterval:(NSInteger)timeInterval;

/**
 *  返回时间字符串
 */
+ (NSString *)dateStringWithDate:(NSDate *)date;

+ (NSString *)dateStringWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

@end
