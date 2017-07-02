//
//  YBInvestRecordCell2.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBInvestRecordCell2.h"

@implementation YBInvestRecordCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)headerView
{
    YBInvestRecordCell2 *headerView = [[[NSBundle mainBundle] loadNibNamed:@"YBInvestRecordCell2" owner:self options:nil] lastObject];
    headerView.frame = CGRectMake(0, 0, kScreenW, 44);
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.phoneLabel.text = @"投资用户";
    headerView.phoneLabel.textColor = kNavColor;
    headerView.phoneLabel.font = [UIFont systemFontOfSize:16];
    
    headerView.moneyLabel.text = @"投资金额(元)";
    headerView.moneyLabel.textColor = kNavColor;
    headerView.moneyLabel.font = [UIFont systemFontOfSize:16];
    
    headerView.timeLabel.text = @"投资时间";
    headerView.timeLabel.textColor = kNavColor;
    headerView.timeLabel.font = [UIFont systemFontOfSize:16];
    
    return headerView;
}

@end
