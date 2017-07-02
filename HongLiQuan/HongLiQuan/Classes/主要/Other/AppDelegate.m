//
//  AppDelegate.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/5/31.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "AppDelegate.h"
#import "YBTabBarController.h"
#import "YBShareTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [YBShareTool setupConfigShareSDK];
    
    [self initWindow];
        
    YBLog(@"%@", [NSString stringWithMoney:123123456.098]);
    
    return YES;
}

- (void)initWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [YBTabBarController new];
    [self.window makeKeyAndVisible];
}


@end
