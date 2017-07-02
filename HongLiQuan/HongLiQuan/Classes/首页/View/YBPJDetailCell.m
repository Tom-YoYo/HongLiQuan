//
//  YBPJDetailCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBPJDetailCell.h"

@implementation YBPJDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (int i = 0; i<4; i++) {
        [self getLabelForTag:i+1].adjustsFontSizeToFitWidth = YES;
        [self getLabelForTag:i+1].layer.cornerRadius = 2;
        [self getLabelForTag:i+1].layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self getLabelForTag:i+1].layer.borderWidth = 1;
    }
}

- (UILabel *)getLabelForTag:(NSInteger)tag
{
    return [self.contentView viewWithTag:tag];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
