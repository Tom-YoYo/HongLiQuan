//
//  UIAlertView+YB.m
//  SWWH
//
//  Created by cy on 16/7/4.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "UIAlertView+YB.h"
#import <objc/runtime.h>

static char *UIAlertViewClickedKey = "UIAlertViewClickedKey";

@interface UIAlertView ()<UIAlertViewDelegate>

@property (nonatomic, strong) UIAlertViewClicked clicked;

@end

@implementation UIAlertView (YB)

- (void)setClicked:(UIAlertViewClicked)clicked
{
    objc_setAssociatedObject(self, UIAlertViewClickedKey, clicked, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIAlertViewClicked)clicked
{
    return objc_getAssociatedObject(self, UIAlertViewClickedKey);
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons clicked:(UIAlertViewClicked)clicked
{
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:buttons[0] otherButtonTitles:buttons.count==1?nil:buttons[1], nil];
    if (self) {
        self.clicked = clicked;
    }
    return self;
}

+ (void) showWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons clicked:(UIAlertViewClicked)clicked
{
    UIAlertView *alertView = [[self alloc] initWithTitle:title message:message buttons:buttons clicked:clicked];
    [alertView show];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttons style:(UIAlertViewStyle)style clicked:(UIAlertViewClicked)clicked
{
    UIAlertView *alertView = [[self alloc] initWithTitle:title message:message buttons:buttons clicked:clicked];
    alertView.alertViewStyle = style;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clicked) {
        self.clicked(alertView, buttonIndex);
    }
}

@end
