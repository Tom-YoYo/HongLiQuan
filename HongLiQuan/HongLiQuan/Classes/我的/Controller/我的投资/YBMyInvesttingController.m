//
//  YBMyInvesttingController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMyInvesttingController.h"
#import "YBMyInvestCell.h"

@interface YBMyInvesttingController ()

@end

@implementation YBMyInvesttingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
}

- (void)setupTableHeaderView
{
    if (self.type==0) return;
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 80)];
    headerView.textAlignment = NSTextAlignmentCenter;
    headerView.numberOfLines = 0;
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.font = [UIFont systemFontOfSize:30];
    headerView.textColor = [UIColor redColor];
    NSString *str = @"累计收益(元)\n5,820.00";
    NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 7)];
    [mAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 7)];
    headerView.attributedText = mAttStr;
    self.tableView.tableHeaderView = headerView;
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBMyInvestCell");
    UITableView_AutomaticDimension(self.tableView, 135);
    
    [self setupTableHeaderView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBMyInvestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBMyInvestCell" forIndexPath:indexPath];
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
