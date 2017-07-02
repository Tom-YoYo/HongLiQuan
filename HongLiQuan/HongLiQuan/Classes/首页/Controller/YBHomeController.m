//
//  YBHomeController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/5/31.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHomeController.h"
#import "YBHomeHeaderView.h"
#import "YBHomeCell.h"
#import "YBHomeCell2.h"
#import "YBHomeFooterCell.h"
#import "YBHQDetailController.h"
#import "YBPJDetailController.h"

@interface YBHomeController ()

@end

@implementation YBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    [self.navigationController pushViewController:[NSClassFromString(@"YBTestController") new] animated:YES];
}

- (void)setupTableView
{
    [self setupTableHeaderView];
    UITableView_RegisterFormNib(self.tableView, @"YBHomeCell");
    UITableView_RegisterFormNib(self.tableView, @"YBHomeCell2");
    UITableView_RegisterFormNib(self.tableView, @"YBHomeFooterCell");
    UITableView_AutomaticDimension(self.tableView, 200);
}

- (void)setupTableHeaderView
{
    YBHomeHeaderView *homeView = [YBHomeHeaderView homeHeaderView];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, homeView.height)];
    [headerView addSubview:homeView];
    self.tableView.tableHeaderView = headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBHomeCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section==3) {
        YBHomeFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBHomeFooterCell" forIndexPath:indexPath];
        return cell;
    } else {
        YBHomeCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"YBHomeCell2" forIndexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        YBHQDetailController *detailVC = [YBHQDetailController new];
        [self.navigationController pushViewController:detailVC animated:YES];
    } else if (indexPath.section==3) {
        
    } else {
        YBPJDetailController *detailVC = [YBPJDetailController new];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
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
