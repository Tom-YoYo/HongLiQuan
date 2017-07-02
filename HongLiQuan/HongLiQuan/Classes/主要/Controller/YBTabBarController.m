//
//  YBTabBarController.m
//  ZCWL
//
//  Created by ios-dev on 16/2/26.
//  Copyright © 2016年 com.zcwljs.cnge.app. All rights reserved.
//

#import "YBTabBarController.h"
#import "YBNavigationController.h"
#import "YBHomeController.h"
#import "YBMoneyController.h"
#import "YBFindController.h"
#import "YBMeController.h"
#import "YBLoginController.h"

@interface YBTabBarController ()<UITabBarControllerDelegate>

@end

@implementation YBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self addAllChildViewControllers];
}

- (void)addAllChildViewControllers
{
    YBHomeController *homeVC = [YBHomeController new];
    [self addOneChlildVc:homeVC title:@"首页" imageName:@"\U0000e788" selectedImageName:@"\U0000e788"];
    
    YBMoneyController *moneyVC = [YBMoneyController new];
    [self addOneChlildVc:moneyVC title:@"理财" imageName:@"\U0000e76c" selectedImageName:@"\U0000e76c"];
    
    YBFindController *findVC = [YBFindController new];
    [self addOneChlildVc:findVC title:@"发现" imageName:@"\U0000e767" selectedImageName:@"\U0000e767"];
    
    YBMeController *meVC = [YBMeController new];
    [self addOneChlildVc:meVC title:@"我的" imageName:@"\U0000e765" selectedImageName:@"\U0000e765"];

    
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [[UIImage imageWithInfo:YBIconInfoMake(imageName, 22, [UIColor lightGrayColor])] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //    textAttrs[UITextAttributeTextColor] = kGrayColor;
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[UITextAttributeTextColor] = kNavColor;
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [[UIImage imageWithInfo:YBIconInfoMake(selectedImageName, 22, kNavColor)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    YBNavigationController *nav = [[YBNavigationController alloc] init];
    [nav pushViewController:childVc animated:NO];
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
//    UINavigationController *nav = (YBNavigationController *)viewController;
//    
//    if ([nav.viewControllers[0] isKindOfClass:[YBMeController class]]) {
//        
//        YBNavigationController *nav = [[YBNavigationController alloc] initWithRootViewController:[YBLoginController new]];
//        [self presentViewController:nav animated:YES completion:nil];
//        
//        return NO;
//    }
    return YES;
}

@end
