//
//  YBMeFooterView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMeFooterView.h"
#import "YBAlertView.h"

@implementation YBMeFooterView

+ (UIView *)footerView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 84)];
    YBMeFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"YBMeFooterView" owner:self options:nil] lastObject];
    footerView.frame = view.bounds;
    [view addSubview:footerView];
    return view;
}

+ (UIView *)footerViewForHQDetail
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH-64-84, kScreenW, 84)];
    view.backgroundColor = [UIColor whiteColor];
    YBMeFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"YBMeFooterView" owner:self options:nil] lastObject];
    footerView.frame = view.bounds;
    [view addSubview:footerView];
    
    [[footerView getBtnForTag:1] setTitle:@"转出" forState:UIControlStateNormal];
    [[footerView getBtnForTag:2] setTitle:@"转入" forState:UIControlStateNormal];
    [[[footerView getBtnForTag:1] rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [YBAlertView show:YBAlertViewTypeBindBankSuccess didClicked:^(NSInteger index) {
            
        }];
    }];
    [[[footerView getBtnForTag:2] rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [YBAlertView show:YBAlertViewTypeNoBindBank didClicked:^(NSInteger index) {
            
        }];
    }];
    
    return view;
}

- (UIButton *)getBtnForTag:(NSInteger)tag
{
    return [self viewWithTag:tag];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    [self viewWithTag:1].layer.cornerRadius = 5;
    [self viewWithTag:1].layer.borderWidth = 1;
    [self viewWithTag:1].layer.borderColor = [UIColor redColor].CGColor;
    
    [self viewWithTag:2].layer.cornerRadius = 5;
}

@end
