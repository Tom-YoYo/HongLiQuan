//
//  YBMeHeaderView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/16.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMeHeaderView.h"
#import "YBMessageController.h"
#import "YBVCTool.h"
#import "YBMeSettingController.h"
#import "YBTransactionRecordController.h"
#import "YBMyBankController.h"

@implementation YBMeHeaderView

+ (UIView *)headerView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 260)];
    YBMeHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"YBMeHeaderView" owner:self options:nil] lastObject];
    headerView.frame = view.bounds;
    [view addSubview:headerView];
    return view;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.userBtn.layer.cornerRadius = 20;
    self.userBtn.clipsToBounds = YES;
    
    self.messageBadgLabel.layer.cornerRadius = 10;
    self.messageBadgLabel.clipsToBounds = YES;
    
    [self.messageBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e73f", 30, [UIColor whiteColor])] forState:UIControlStateNormal];
    
    self.markLabel.adjustsFontSizeToFitWidth = YES;
    self.qrCodeImgVIew.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e642", 30, [UIColor whiteColor])];
    
    [self.myBankBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e76a", 40, kColor(78, 197, 245))] forState:UIControlStateNormal];
    [self.recordDescBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e76f", 40, kColor(140, 244, 187))] forState:UIControlStateNormal];
    [self.aboutBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e76b", 40, kColor(193, 145, 246))] forState:UIControlStateNormal];
    [self.moneyedBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e769", 40, kColor(129, 165, 252))] forState:UIControlStateNormal];
    
    
    [[self.messageBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[YBVCTool getWeakCurrentVC].navigationController pushViewController:[YBMessageController new] animated:YES];
    }];
    
    [[self.userBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[YBVCTool getWeakCurrentVC].navigationController pushViewController:[YBMeSettingController new] animated:YES];
    }];
    
    [[self.recordDescBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[YBVCTool getWeakCurrentVC].navigationController pushViewController:[YBTransactionRecordController new] animated:YES];
    }];
    
    [[self.myBankBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[YBVCTool getWeakCurrentVC].navigationController pushViewController:[YBMyBankController new] animated:YES];
    }];
    
}

@end
