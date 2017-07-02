//
//  YBInvestRecordCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBInvestRecordCell.h"

@implementation YBInvestRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setGrad:(NSInteger)grad
{
    _grad = grad;
    if (grad==1) {
        self.imgView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e77a", 30, KColorFromRGB(0xf7ca49))];
    } else if (grad==2) {
        self.imgView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e77b", 30, KColorFromRGB(0xc1c4d8))];
    } else if (grad==3) {
        self.imgView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e77c", 30, KColorFromRGB(0xdb9076))];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
