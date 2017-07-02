//
//  YZMView.h
//  验证码_Demo
//
//  Created by Jason on 15/8/31.
//  Copyright (c) 2015年 www.jizhan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZMView : UIView

/**
 *  验证码的个数
 */
@property (nonatomic, assign) NSInteger count;

/**
 *  验证码
 */
@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) void(^refresh)();

+ (instancetype)yzmViewWithFrame:(CGRect)frame count:(NSInteger)count;

+ (instancetype)yzmViewWithFrame:(CGRect)frame code:(NSString *)code;



@end
