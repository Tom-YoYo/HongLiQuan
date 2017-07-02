//
//  YBNavigationController.m
//  ZCWL
//
//  Created by ios-dev on 16/2/29.
//  Copyright © 2016年 com.zcwljs.cnge.app. All rights reserved.
//

#import "YBNavigationController.h"
#import "UIImage+Color.h"

@interface YBNavigationController ()

@end

@implementation YBNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavigation];
}

- (void)setupNavigation
{
    [self.navigationBar setBackgroundImage:[UIImage imageFromContextWithColor:kNavColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.alpha = 1;
    
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor]};
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    if (!self.viewControllers.count) {
        
    } else {
        self.navigationBarHidden = NO;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    return [super popToRootViewControllerAnimated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.navigationBar endEditing:YES];
    [self.view endEditing:YES];
    return [super popViewControllerAnimated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}



@end
