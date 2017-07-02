//
//  YBHQDetailHeaderView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHQDetailHeaderView.h"

@implementation YBHQDetailHeaderView

+ (UIView *)headerView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 200)];
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"YBHQDetailHeaderView" owner:self options:nil] lastObject];
    headerView.backgroundColor = kNavColor;
    headerView.frame = view.bounds;
    [view addSubview:headerView];
    return view;
}

@end
