//
//  NSString+Format.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/21.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

+ (instancetype)stringWithMoney:(CGFloat)money
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    // 设置格式
    [numberFormatter setPositiveFormat:@"###,##0.00;"];
//    [numberFormatter setPositiveSuffix:@"元"];
    [numberFormatter setPositivePrefix:@"¥"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:@(money)];
    return formattedNumberString;
}

@end
