//
//  YBWithdrawController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/7/2.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBWithdrawController.h"
#import "YBPayMoneyCell.h"
#import "YBPaySelectBankCell.h"
#import "YBInputPwdAlert.h"

@interface YBWithdrawController ()

@end

@implementation YBWithdrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提现";
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_AutomaticDimension(self.tableView, 65);
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 124)];
    UIButton *confirmBtn = YB_CreateBtn(CGRectMake(16, 40, kScreenW-32, 44), @"确认提现");
    [[confirmBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        YBInputPwdAlert *alertView = [YBInputPwdAlert alertView];
        [alertView show];
    }];
    [footerView addSubview:confirmBtn];
    self.tableView.tableFooterView = footerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBPaySelectBankCell *cell = [YBPaySelectBankCell cellWithTableView:tableView];
        cell.titleLabel.text = @"到账银行卡";
        return cell;
    } else if (indexPath.section==1) {
        YBPayMoneyCell *cell = [YBPayMoneyCell cellWithTableView:tableView];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeightForSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

@end
