//
//  UIAlertView+YB.h
//  SWWH
//
//  Created by cy on 16/7/4.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewClicked)(UIAlertView *alertView, NSInteger index);

@interface UIAlertView (YB)

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons clicked:(UIAlertViewClicked)clicked;

+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons clicked:(UIAlertViewClicked)clicked;

+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons style:(UIAlertViewStyle)style clicked:(UIAlertViewClicked)clicked;

@end
