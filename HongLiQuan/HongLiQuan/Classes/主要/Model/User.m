//
//  User.m
//  Wanyingjinrong
//
//  Created by Jason on 15/11/13.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import "User.h"
#import "UserManager.h"

#define USER_PASSWORD @"PASSWORD"
#define USER_PHONE @"PHONENUM"
#define USER_USERID @"USER_USERID"
#define USER_TICKET @"USER_TICKET"
#define USER_IM_TICKET @"USER_IM_TICKET"
#define USER_USERNAME @"USER_USERNAME"

@implementation User

//解档时调用
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.phone = [coder decodeObjectForKey:USER_PHONE];
        self.password = [coder decodeObjectForKey:USER_PASSWORD];
        self.userid = [[coder decodeObjectForKey:USER_USERID] integerValue];
        self.ticket = [coder decodeObjectForKey:USER_TICKET];
        self.imTicket = [coder decodeObjectForKey:USER_IM_TICKET];
        self.username = [coder decodeObjectForKey:USER_USERNAME];
    }
    return self;
}

//归档时调用
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.password forKey:USER_PASSWORD];
    [coder encodeObject:self.phone forKey:USER_PHONE];
    [coder encodeObject:@(self.userid) forKey:USER_USERID];
    [coder encodeObject:self.ticket forKey:USER_TICKET];
    [coder encodeObject:self.imTicket forKey:USER_IM_TICKET];
    [coder encodeObject:self.username forKey:USER_USERNAME];
}

+ (instancetype)userWithPhone:(NSString *)phone password:(NSString *)password
{
    User *user = [[User alloc] init];
    user.phone = phone;
    user.password = password;
    return user;
}



@end
