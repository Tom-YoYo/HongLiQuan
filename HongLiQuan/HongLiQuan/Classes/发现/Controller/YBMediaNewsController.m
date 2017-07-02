//
//  YBMediaNewsController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMediaNewsController.h"
#import "YBMediaNewsCell.h"

@interface YBMediaNewsController ()

@end

@implementation YBMediaNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"媒体报道";
    [self setupTableView];
}

- (void)setupTableView
{
    UITableView_RegisterFormNib(self.tableView, @"YBMediaNewsCell");
    UITableView_AutomaticDimension(self.tableView, 100);
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
    YBMediaNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YBMediaNewsCell" forIndexPath:indexPath];
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
    return kHeightForSection;
}

@end
