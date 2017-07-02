//
//  UserTool.m
//  Wanyingjinrong
//
//  Created by Jason on 15/11/17.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import "UserTool.h"
#import "NSUserDefaults+Extension.h"
#import "YBAES.h"
#import "YBHttpTool.h"
#import "UIDevice+IdentifierAddition.h"
#import <MJExtension.h>
#import "UIAlertView+Block.h"

NSString* const CurrentLoginUser = @"CurrentLoginUser";//保存当前登录用户的key
NSString* const PASSWORD = @"jd8123&&%sd23921hdasd";//对用户密码加密的密语

@implementation UserTool

+ (void)login:(User *)user
{
     if (user.password.length==0||user.phone.length==0||user.ticket.length==0) return;
    NSString *password = user.password;
    NSDictionary *params = @{@"phone":user.phone,
                             @"password":password,
                             @"mac":[[UIDevice currentDevice] uniqueGlobalDeviceIdentifier]};
    
}

+ (void)saveUser:(User *)user
{
    [self encryptUser:user];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    [NSUserDefaults saveObject:data key:CurrentLoginUser];
}

+ (User *)getCurrentLoginUser
{
    NSData *data = [NSUserDefaults getObjectForKey:CurrentLoginUser];
    if (!data) return nil;
    User *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [self decryptUser:user];
    return user;
}

//注销当前用户
+ (void)logoutCurrentUser
{
    NSData *data = [NSUserDefaults getObjectForKey:CurrentLoginUser];
    User *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    user.password = @"";
    user.ticket = @"";
    NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    [NSUserDefaults saveObject:data2 key:CurrentLoginUser];
}

//对user加密
+ (void)encryptUser:(User *)user
{
    user.password = [YBAES encrypt:user.password password:PASSWORD];
}

//对user解密
+ (void)decryptUser:(User *)user
{
    user.password = [YBAES decrypt:user.password password:PASSWORD];
}


@end
