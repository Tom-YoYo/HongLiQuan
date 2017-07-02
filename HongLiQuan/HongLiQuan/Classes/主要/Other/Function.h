//
//  Function.h
//  SWWH
//
//  Created by cy on 16/7/1.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

void UITableView_RegisterFormNib(UITableView *tableView, NSString *nibName);
void UITableView_RegisterFormClass(UITableView *tableView, NSString *className);

void UITableView_AutomaticDimension(UITableView *tableView, CGFloat estimatedRowHeight);

UIButton *YB_CreateBtn(CGRect frame, NSString *title);


UITableViewCell* Get_UITableViewCell(UITableView *tableView, NSInteger section, NSInteger row);
