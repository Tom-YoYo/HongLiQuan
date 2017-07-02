//
//  YBMeSettingController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMeSettingController.h"
#import "YBMeSetCell.h"
#import "YBRealnameController.h"
#import "YBPwdManageController.h"
#import <ShareSDK/ShareSDK.h>

@interface YBMeSettingController ()

@end

@implementation YBMeSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人设置";
    [self setupTableView];
}
- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBMeSetCell");
    UITableView_AutomaticDimension(self.tableView, 64);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 1;
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBMeSetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBMeSetCell" forIndexPath:indexPath];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.accessoryType = indexPath.row==0?UITableViewCellAccessoryNone:UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row==0) {
            cell.textLabel.text = @"绑定手机";
            cell.detailTextLabel.text = @"158****0732";
        } else if (indexPath.row==1) {
            cell.textLabel.text = @"绑定微信";
        } else if (indexPath.row==2) {
            cell.textLabel.text = @"实名认证";
            cell.detailTextLabel.text = @"西西里";
        }else if (indexPath.row==3) {
            cell.textLabel.text = @"密码管理";
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        
    } else {
        if (indexPath.row==1) {
            [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
                
            }];
        } else if (indexPath.row==2) {
            [self.navigationController pushViewController:[YBRealnameController new] animated:YES];
        } else if (indexPath.row==3) {
            [self.navigationController pushViewController:[YBPwdManageController new] animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) return 90;
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
