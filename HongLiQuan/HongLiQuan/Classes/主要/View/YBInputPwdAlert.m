//
//  YBInputPwdAlert.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/21.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBInputPwdAlert.h"

@implementation YBInputPwdAlert

+ (instancetype)alertView
{
    YBInputPwdAlert *alertView = [super alertView];
    alertView.frame = CGRectMake(0, 0, kScreenW-60, 216);
    
    UITextField *tf = [[alertView viewWithTag:1] viewWithTag:2];
    tf.tintColor = [UIColor clearColor];
    [tf becomeFirstResponder];
    tf.delegate = alertView;
    @weakify(alertView)
    @weakify(tf)
    [[alertView rac_signalForSelector:@selector(textFieldShouldReturn:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(id  _Nullable x) {
        @strongify(tf)
        [tf resignFirstResponder];
    }];
    
    [[tf rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(__kindof UITextField * _Nullable x) {
        @strongify(alertView)
        if (x.text.length>6) {
            x.text = [x.text substringToIndex:6];
            [alertView setup:6];
        } else {
           [alertView setup:x.text.length];
        }
    }];
    
    UIButton *btn = [alertView viewWithTag:100];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(alertView)
        [alertView close];
    }];
    return alertView;
}

- (void)show
{
    [super show];
    self.y -= 50;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)setup:(NSInteger)count
{
    for (int i = 0; i<6; i++) {
        [[self viewWithTag:1] viewWithTag:i+11].hidden = i>=count;
    }
}


@end
