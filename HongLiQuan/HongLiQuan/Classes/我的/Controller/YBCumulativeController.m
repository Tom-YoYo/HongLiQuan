//
//  YBCumulativeController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBCumulativeController.h"
#import "YBCumulativeCell.h"

@interface YBCumulativeController ()

@end

@implementation YBCumulativeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"累计收益";
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBCumulativeCell");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 1;
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBCumulativeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBCumulativeCell" forIndexPath:indexPath];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.detailTextLabel.textColor = [UIColor redColor];
        if (indexPath.row==0) {
            cell.textLabel.text = @"活期+收益";
        } else if (indexPath.row==1) {
            cell.textLabel.text = @"体验金收益";
        } else if (indexPath.row==2) {
            cell.textLabel.text = @"定期收益";
        } else if (indexPath.row==3) {
            cell.textLabel.text = @"现金奖励收益";
        } else if (indexPath.row==4) {
            cell.textLabel.text = @"加息券收益";
        } else if (indexPath.row==5) {
            cell.textLabel.text = @"理财师收益";
        }
        cell.detailTextLabel.text = @"+23.92";
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) return 100;
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
