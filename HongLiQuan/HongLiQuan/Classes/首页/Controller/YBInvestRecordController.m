//
//  YBInvestRecordController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBInvestRecordController.h"
#import "YBInvestRecordCell.h"
#import "YBInvestRecordCell2.h"

@interface YBInvestRecordController ()

@end

@implementation YBInvestRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"投资记录";
    [self setupTableView];
}

- (void)setupTableView
{
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UITableView_RegisterFormNib(self.tableView, @"YBInvestRecordCell");
    UITableView_RegisterFormNib(self.tableView, @"YBInvestRecordCell2");
    UITableView_AutomaticDimension(self.tableView, 54);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 3;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBInvestRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBInvestRecordCell" forIndexPath:indexPath];
        cell.grad = indexPath.row+1;
        return cell;
    } else {
        YBInvestRecordCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"YBInvestRecordCell2" forIndexPath:indexPath];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
        headerView.textAlignment = NSTextAlignmentCenter;
        headerView.textColor = kNavColor;
        headerView.backgroundColor = [UIColor whiteColor];
        headerView.font = [UIFont systemFontOfSize:16];
        headerView.text = @"排行榜";
        return headerView;
    } else {
        return [YBInvestRecordCell2 headerView];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1) return CGFLOAT_MIN;
    return kHeightForSection;
}

@end
