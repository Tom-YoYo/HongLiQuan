//
//  Function.m
//  SWWH
//
//  Created by cy on 16/7/1.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "Function.h"

void UITableView_RegisterFormNib(UITableView *tableView, NSString *nibName)
{
    [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
}

void UITableView_RegisterFormClass(UITableView *tableView, NSString *className)
{
    [tableView registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
}

void UITableView_AutomaticDimension(UITableView *tableView, CGFloat estimatedRowHeight)
{
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = estimatedRowHeight;
}

UITableViewCell* Get_UITableViewCell(UITableView *tableView, NSInteger section, NSInteger row)
{
    return [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
}

UIButton *YB_CreateBtn(CGRect frame, NSString *title)
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = kNavColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    return btn;
}

