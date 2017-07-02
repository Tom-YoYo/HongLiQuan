//
//  YBPJDetailController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBPJDetailController.h"
#import "YBHQDetailHeaderView.h"
#import "YBShareTool.h"
#import "YBPJDetailCell.h"
#import "YBHostoryProjectController.h"
#import "YBInvestRecordController.h"

@interface YBPJDetailController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YBPJDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"季利宝160801期";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e678", 22, [UIColor whiteColor])] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBPJDetailCell");
    [self setupTableHeaderView];
    [self setupTableFooterView];
}

- (void)setupTableHeaderView
{
    self.tableView.tableHeaderView = [YBHQDetailHeaderView headerView];
}

- (void)setupTableFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH-64-84, kScreenW, 84)];
    footerView.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(8, 20, kScreenW-16, 44);
    btn.backgroundColor = kNavColor;
    [btn setTitle:@"立即买入" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    [footerView addSubview:btn];
    [self.view addSubview:footerView];
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBPJDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBPJDetailCell" forIndexPath:indexPath];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row==0) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e68a", 30, [UIColor grayColor])];
            cell.textLabel.text = @"产品详情";
        } else if (indexPath.row==1) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e745", 30, [UIColor grayColor])];
            cell.textLabel.text = @"安全保障";
        } else if (indexPath.row==2) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e603", 30, [UIColor grayColor])];
            cell.textLabel.text = @"投资记录";
            cell.detailTextLabel.text = @"50人";
        } else if (indexPath.row==3) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e603", 30, [UIColor grayColor])];
            cell.textLabel.text = @"往期项目";
        } else if (indexPath.row==4) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e6ed", 30, [UIColor grayColor])];
            cell.textLabel.text = @"法律合同";
        } else if (indexPath.row==5) {
            cell.imageView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e614", 30, [UIColor grayColor])];
            cell.textLabel.text = @"离投标结束";
            cell.detailTextLabel.text = @"6天12小时25分38秒";
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        if (indexPath.row==2) {
            YBInvestRecordController *vc = [YBInvestRecordController new];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row==3) {
            YBHostoryProjectController *hosVC = [YBHostoryProjectController new];
            [self.navigationController pushViewController:hosVC animated:YES];
        }
    }
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
    if (section==1) return kHeightForSection;
    return CGFLOAT_MIN;
}

@end
