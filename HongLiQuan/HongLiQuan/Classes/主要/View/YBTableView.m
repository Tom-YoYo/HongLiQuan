//
//  YBTableView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/7/2.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBTableView.h"
#import "YBVCTool.h"

@implementation YBTableView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (![view isKindOfClass:[UITextField class]] && ![view isKindOfClass:[UITextView class]]) {
        [self endEditing:YES];
        [self.superview endEditing:YES];
        
        [self.superview.superview endEditing:YES];
        UIViewController *vc = [YBVCTool getCurrentVC];
        [vc.navigationController.navigationBar endEditing:YES];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            [((UINavigationController *)vc).navigationBar endEditing:YES];
        }
    }
    return view;
}

@end
