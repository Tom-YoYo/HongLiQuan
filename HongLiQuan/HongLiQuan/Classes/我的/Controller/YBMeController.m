//
//  YBMeController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/5/31.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMeController.h"
#import "YBMeHeaderView.h"
#import "YBMeFooterView.h"
#import "YBMyInvestController.h"
#import "YBMyCouponController.h"
#import "YBCumulativeController.h"
#import "YBPayController.h"
#import "YBWithdrawController.h"

@interface YBMeController ()

@end

@implementation YBMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setupTableView
{
    self.tableView.tableHeaderView = [YBMeHeaderView headerView];
    [self setupTableFooterView];
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
}

- (void)setupTableFooterView
{
    UIView *view = [YBMeFooterView footerView];
    YBMeFooterView *footView = [view.subviews firstObject];
    YBWeakSelf
    [[footView.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        YBWithdrawController *payVC = [YBWithdrawController new];
        [weakSelf.navigationController pushViewController:payVC animated:YES];
    }];
    [[footView.rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        YBPayController *payVC = [YBPayController new];
        [weakSelf.navigationController pushViewController:payVC animated:YES];
    }];
    self.tableView.tableFooterView = view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
//    [cell setValue:@(0) forKey:@"style"];
    if ([cell respondsToSelector:@selector(setStyle:)]) {
        YBLog(@"%s", __FUNCTION__);
    }
    if (indexPath.row==0) {
        cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e770", 30, KColorFromRGB(0xff6b57))];
        cell.textLabel.text = @"我的投资";
        cell.detailTextLabel.text = @"¥5,000.00";
        cell.detailTextLabel.textColor = [UIColor redColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.row==1) {
        cell.textLabel.text = @"累计收益";
        cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e743", 30, KColorFromRGB(0x5ed9a4))];
        cell.detailTextLabel.text = @"¥5,000.00";
        cell.detailTextLabel.textColor = [UIColor redColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.row==2) {
        cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e73d", 30, KColorFromRGB(0x7ea2ff))];
        cell.textLabel.text = @"昨日收益";
        cell.detailTextLabel.text = @"¥5,000.00";
//        cell.detailTextLabel.textColor = [UIColor redColor];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.row==3) {
        cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e76e", 30, KColorFromRGB(0xc288f8))];
        cell.textLabel.text = @"我的余额";
        cell.detailTextLabel.text = @"¥5,000.00";
//        cell.detailTextLabel.textColor = [UIColor redColor];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.row==4) {
        cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e738", 30, KColorFromRGB(0x4ec3f3))];
        cell.textLabel.text = @"我的卡券";
        cell.detailTextLabel.text = @"可用3张";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        YBMyInvestController *vc = [YBMyInvestController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row==1) {
        YBCumulativeController *vc = [YBCumulativeController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row==4) {
        YBMyCouponController *vc = [YBMyCouponController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
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
