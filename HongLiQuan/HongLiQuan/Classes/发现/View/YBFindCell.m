//
//  YBFindCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/16.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBFindCell.h"
#import "YBHomeButton.h"
#import "YBVCTool.h"
#import "YBMediaNewsController.h"
#import "YBInviteController.h"

@implementation YBFindCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self getBtnForTag:1].imageWidth = 80;
    [[self getBtnForTag:1] setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e748", 80, kColor(251, 108, 92))] forState:UIControlStateNormal];
    
    [self getBtnForTag:2].imageWidth = 40;
    [[self getBtnForTag:2] setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e75a", 40, kColor(99, 216, 165))] forState:UIControlStateNormal];
    
    [self getBtnForTag:3].imageWidth = 40;
    [[self getBtnForTag:3] setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e759", 40, kColor(84, 196, 243))] forState:UIControlStateNormal];
    
    [self getBtnForTag:4].imageWidth = 40;
    [[self getBtnForTag:4] setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e78b", 40, kColor(191, 139, 245))] forState:UIControlStateNormal];
    
    [self getBtnForTag:5].imageWidth = 40;
    [[self getBtnForTag:5] setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e78c", 40, kColor(128, 164, 252))] forState:UIControlStateNormal];
    
    [self handleEvent];
}

- (void)handleEvent
{
    [[[self getBtnForTag:1] rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[YBVCTool getWeakCurrentVC].navigationController pushViewController:[YBInviteController new] animated:YES];
    }];
    [[[self getBtnForTag:5] rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [[YBVCTool getWeakCurrentVC].navigationController pushViewController:[YBMediaNewsController new] animated:YES];
    }];
}

- (YBHomeButton *)getBtnForTag:(NSInteger)tag
{
    return [self.contentView viewWithTag:tag];
}

@end
