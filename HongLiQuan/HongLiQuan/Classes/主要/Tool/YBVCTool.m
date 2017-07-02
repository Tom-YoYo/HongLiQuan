//
//  YBVCTool.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBVCTool.h"

@implementation YBVCTool

+ (UIViewController *)getCurrentVC
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    UITabBarController *rootVC = (UITabBarController *)window.rootViewController;
    
    if (rootVC.presentedViewController) {//跳到登录界面了
        UINavigationController *nav = (UINavigationController *)rootVC.presentedViewController;
        return nav.topViewController;
    } else {
        UINavigationController *nav = rootVC.selectedViewController;
        return nav.topViewController;
    }
}

+ (UIViewController *)getWeakCurrentVC
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    UITabBarController *rootVC = (UITabBarController *)window.rootViewController;
    
    if (rootVC.presentedViewController) {//跳到登录界面了
        UINavigationController *nav = (UINavigationController *)rootVC.presentedViewController;
        __weak typeof(UIViewController *) weakVC = nav.topViewController;
        return weakVC;
    } else {
        UINavigationController *nav = rootVC.selectedViewController;
        __weak typeof(UIViewController *) weakVC = nav.topViewController;
        return weakVC;
    }
}

@end
