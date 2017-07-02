//
//  YBHomeFooterCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/16.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHomeFooterCell.h"

@implementation YBHomeFooterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    [[self getBtnForTag:2] setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e6c1", 35, [UIColor redColor])] forState:UIControlStateNormal];
    
    
    
}

- (UIButton *)getBtnForTag:(NSInteger)tag
{
    return [self.contentView viewWithTag:tag];
}

@end
