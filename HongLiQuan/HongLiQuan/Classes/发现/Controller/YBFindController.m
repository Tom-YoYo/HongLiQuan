//
//  YBFindController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/5/31.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBFindController.h"
#import "YBCycleView.h"
#import "YBFindCell.h"
#import "YBFindCell2.h"

@interface YBFindController ()

@end

@implementation YBFindController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupTableView];
    
}

- (void)setupTableView
{
    [self setupTableHeaderView];
    UITableView_RegisterFormNib(self.tableView, @"YBFindCell");
    UITableView_RegisterFormNib(self.tableView, @"YBFindCell2");
    UITableView_AutomaticDimension(self.tableView, 100);
}

- (void)setupTableHeaderView
{
    YBCycleView *cycleView = [[YBCycleView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 160) images:@[@"1"] currentIndex:0 didSelectForIndex:^(NSInteger index) {
        
    }];
    self.tableView .tableHeaderView = cycleView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 1;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBFindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBFindCell" forIndexPath:indexPath];
        return cell;
    } else {
        YBFindCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"YBFindCell2" forIndexPath:indexPath];
        return cell;
    }
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
