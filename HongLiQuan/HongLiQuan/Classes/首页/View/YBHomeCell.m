//
//  YBHomeCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/1.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHomeCell.h"

@implementation YBHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.payBtn.layer.cornerRadius = 15;
    self.payBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.payBtn.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
