//
//  User.h
//  Wanyingjinrong
//
//  Created by Jason on 15/11/13.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *username;


/**
 头像
 */
@property (nonatomic, copy) NSString *img;

/**
 *  手机号码
 */
@property (nonatomic, copy) NSString *phone;
/**
 *  密码
 */
@property (nonatomic, copy) NSString *password;
/**
 *  用户编号
 */
@property (nonatomic, assign) NSInteger userid;
/**
 *  用户后续访问票据
 */
@property (nonatomic, copy) NSString *ticket;

/**
 *  IM登陆
 */
@property (nonatomic, copy) NSString *imTicket;


+ (instancetype)userWithPhone:(NSString *)phone password:(NSString *)password;

@end
