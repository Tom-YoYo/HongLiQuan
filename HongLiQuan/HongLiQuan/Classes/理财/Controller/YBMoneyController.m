//
//  YBMoneyController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/5/31.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMoneyController.h"
#import "YBHomeCell.h"
#import "YBHomeCell2.h"
#import "YBHQDetailController.h"
#import "YBPJDetailController.h"

@interface YBMoneyController ()

@end

@implementation YBMoneyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBHomeCell");
    UITableView_RegisterFormNib(self.tableView, @"YBHomeCell2");
    UITableView_AutomaticDimension(self.tableView, 200);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
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
