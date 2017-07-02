//
//  YBPayController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/7/2.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBPayController.h"
#import "YBPayMoneyCell.h"
#import "YBPaySelectBankCell.h"

@interface YBPayController ()

@end

@implementation YBPayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"充值";
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_AutomaticDimension(self.tableView, 65);
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 124)];
    UIButton *nextBtn = YB_CreateBtn(CGRectMake(16, 40, kScreenW-32, 44), @"下一步");
    [[nextBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    [footerView addSubview:nextBtn];
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
        return cell;
    } else if (indexPath.section==1) {
        YBPayMoneyCell *cell = [YBPayMoneyCell cellWithTableView:tableView];
        return cell;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==0) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 34)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW-21, footerView.height)];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentRight;
        label.text = @"本次可充值50.00元";
        [footerView addSubview:label];
        return footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeightForSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) return 34;
    return CGFLOAT_MIN;
}


@end
