//
//  UITableViewCell+YB.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/21.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "UITableViewCell+YB.h"
#import "NSObject+runtime.h"

@implementation UITableViewCell (YB)

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
        if (cell.reuseIdentifier.length==0) {
            [cell setValue:NSStringFromClass(self) forKey:@"reuseIdentifier"];
        }
    }
    return cell;
}

@end
