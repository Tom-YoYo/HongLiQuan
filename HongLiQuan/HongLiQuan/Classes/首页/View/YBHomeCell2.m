//
//  YBHomeCell2.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/16.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHomeCell2.h"

@implementation YBHomeCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.markLabel.layer.cornerRadius = 4;
    self.markLabel.layer.borderWidth = 1;
    self.markLabel.layer.borderColor = kNavColor.CGColor;
    
    NSString *rateStr = @"8.0%\n年化收益率";
    NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:rateStr];
    [mAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 3)];
    [mAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(5, 5)];
    self.rateLabe.attributedText = mAttStr;
    
    
    NSString *timeStr = @"120天\n期限";
    NSMutableAttributedString *mAttTimeStr = [[NSMutableAttributedString alloc] initWithString:timeStr];
    [mAttTimeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25] range:NSMakeRange(0, 3)];
    [mAttTimeStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(5, 2)];
    self.timeLabel.attributedText = mAttTimeStr;
    
    NSString *moneyStr = @"236.01元\n每万元收益";
    NSMutableAttributedString *mAttMoneyStr = [[NSMutableAttributedString alloc] initWithString:moneyStr];
    [mAttMoneyStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25] range:NSMakeRange(0, 6)];
    [mAttMoneyStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(8, 5)];
    self.moneyLabel.attributedText = mAttMoneyStr;
    
    
    
    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, 38)];
    [bezierPath addLineToPoint:CGPointMake(kScreenW, 38)];
    [[UIColor groupTableViewBackgroundColor] setStroke];
    [bezierPath stroke];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
