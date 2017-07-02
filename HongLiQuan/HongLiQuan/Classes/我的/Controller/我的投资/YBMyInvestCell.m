//
//  YBMyInvestCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMyInvestCell.h"

@implementation YBMyInvestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 38)];
    [bezierPath addLineToPoint:CGPointMake(kScreenW, 38)];
    [[UIColor groupTableViewBackgroundColor] setStroke];
    [bezierPath stroke];
}

@end
