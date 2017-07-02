//
//  YBHQDetailController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHQDetailController.h"
#import "YBShareTool.h"
#import "YBHQDetailHeaderView.h"
#import "YBHQDetailCell.h"
#import "YBMeFooterView.h"
#import "YBInvestRecordController.h"

@interface YBHQDetailController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YBHQDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"活期+";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e678", 22, [UIColor whiteColor])] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBHQDetailCell");
    UITableView_AutomaticDimension(self.tableView, 1000);
    [self setupTableHeaderView];
    [self setupTableFooterView];
}

- (void)setupTableHeaderView
{
    self.tableView.tableHeaderView = [YBHQDetailHeaderView headerView];
}

- (void)setupTableFooterView
{
    [self.view addSubview:[YBMeFooterView footerViewForHQDetail]];
}

- (void)share
{
    [YBShareTool share:@"title" content:@"content" url:@"url" images:@[]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 1;
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBHQDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBHQDetailCell" forIndexPath:indexPath];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row==0) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e603", 30, [UIColor grayColor])];
            cell.textLabel.text = @"投资记录";
        } else if (indexPath.row==1) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e745", 30, [UIColor grayColor])];
            cell.textLabel.text = @"安全保障";
        } else if (indexPath.row==2) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e6ed", 30, [UIColor grayColor])];
            cell.textLabel.text = @"法律合同";
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            YBInvestRecordController *recordVC = [YBInvestRecordController new];
            [self.navigationController pushViewController:recordVC animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) return 294;
    return 54;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeightForSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1) return kHeightForSection;
    return CGFLOAT_MIN;
}


@end
