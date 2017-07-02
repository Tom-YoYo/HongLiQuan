//
//  UIBarButtonItem+YB.m
//  SWWH
//
//  Created by 尚往文化 on 16/8/18.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "UIBarButtonItem+YB.h"
#import "Define.h"

@implementation UIBarButtonItem (YB)

+ (instancetype)backItemWithTarget:(id)target action:(SEL)action;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button setTitle:@" 返回" forState:UIControlStateNormal];
    [button setTitleColor:kBlueColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 60, 44);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

@end
