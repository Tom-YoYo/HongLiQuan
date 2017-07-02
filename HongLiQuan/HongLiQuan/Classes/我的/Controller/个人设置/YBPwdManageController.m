//
//  YBPwdManageController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBPwdManageController.h"
#import "YBModifyPwdController.h"
#import "YBSettingTransactionPwdController.h"

@interface YBPwdManageController ()

@end

@implementation YBPwdManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"密码管理";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row==0) {
        cell.textLabel.text = @"登录密码";
        cell.detailTextLabel.text = @"已设置";
    } else if (indexPath.row==1) {
        cell.textLabel.text = @"交易密码";
        cell.detailTextLabel.text = @"未设置";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        YBModifyPwdController *modifyVC = [YBModifyPwdController new];
        [self.navigationController pushViewController:modifyVC animated:YES];
    } else {
        YBSettingTransactionPwdController *modifyVC = [YBSettingTransactionPwdController new];
        [self.navigationController pushViewController:modifyVC animated:YES];
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
