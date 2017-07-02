//
//  UserTool.h
//  Wanyingjinrong
//
//  Created by Jason on 15/11/17.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

extern NSString* const PASSWORD;

@interface UserTool : NSObject

+ (void)login:(User *)user;
+ (void)saveUser:(User *)user;

//注销当前用户
+ (void)logoutCurrentUser;

+ (User *)getCurrentLoginUser;

+ (void)encryptUser:(User *)user;
+ (void)decryptUser:(User *)user;




@end
