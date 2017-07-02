//
//  YBTransactionRecordController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBTransactionRecordController.h"
#import "YBTransactionRecordCell.h"

@interface YBTransactionRecordController ()

@end

@implementation YBTransactionRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"交易明细";
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBTransactionRecordCell");
    UITableView_AutomaticDimension(self.tableView, 70);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBTransactionRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBTransactionRecordCell" forIndexPath:indexPath];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
