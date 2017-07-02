//
//  YBMyBankController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMyBankController.h"
#import "YBMyBankCell.h"

@interface YBMyBankController ()

@end

@implementation YBMyBankController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的银行卡";
    
    [self setupTableView];
}

- (void)setupTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(kHeightForSection, 0, 0, 0);
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    UITableView_RegisterFormNib(self.tableView, @"YBMyBankCell");
    UITableView_AutomaticDimension(self.tableView, 70);
    
    [self setupTableFooterView];
}

- (void)setupTableFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 60)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(16, 8, kScreenW-32, 44);
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitle:@"+添加银行卡" forState:UIControlStateNormal];
    [btn setTitleColor:kNavColor forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor clearColor];
    btn.layer.cornerRadius = 5;
    btn.layer.borderColor = kNavColor.CGColor;
    btn.layer.borderWidth = 1;
    [footerView addSubview:btn];
    self.tableView.tableFooterView = footerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    YBMyBankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBMyBankCell" forIndexPath:indexPath];
    YBMyBankCell *cell = [YBMyBankCell cellWithTableView:tableView];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

@end
