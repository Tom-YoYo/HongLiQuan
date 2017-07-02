//
//  YBHomeHeaderView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/1.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHomeHeaderView.h"
#import "YBHomeButton.h"
#import "YBCycleView.h"
#import "YBPJDetailController.h"
#import "YBVCTool.h"
#import "YBInviteController.h"

@implementation YBHomeHeaderView

+ (instancetype)homeHeaderView
{
    YBHomeHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"YBHomeHeaderView" owner:self options:nil] lastObject];
    headerView.frame = CGRectMake(0, 0, kScreenW, kScreenW/4+65+120);
    return headerView;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSArray<NSString *> *titles = @[@"体验宝", @"安全保障", @"荣誉资质", @"推荐有奖"];
    NSArray<NSString *> *icons = @[@"\U0000e780",@"\U0000e785",@"\U0000e784",@"\U0000e783"];
    NSArray<UIColor *> *colors = @[KColorFromRGB(0x5ed9a4), KColorFromRGB(0xc288f8), KColorFromRGB(0x4ec3f3),kNavColor];
    CGFloat w = kScreenW/titles.count;
    CGFloat h = w;
    
    
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YBHomeButton *btn = [YBHomeButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setImage:[UIImage imageWithText:icons[idx] color:colors[idx] size:CGSizeMake(26, 30)] forState:UIControlStateNormal];

        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.frame = CGRectMake(idx*w, 65, w, h);
        YBWeakSelf
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (idx==0) {
                YBPJDetailController *detailVC = [YBPJDetailController new];
                [[YBVCTool getWeakCurrentVC].navigationController pushViewController:detailVC animated:YES];
            } else if (idx==3) {
                YBInviteController *detailVC = [YBInviteController new];
                [[YBVCTool getWeakCurrentVC].navigationController pushViewController:detailVC animated:YES];
            }
        }];
        [self addSubview:btn];
    }];
    
    
    YBWeakSelf
    YBCycleView *cycleView = [YBCycleView cycleViewWithFrame:CGRectMake(0, 65+h, kScreenW, 120) images:@[@"1"] currentIndex:0 didSelectForIndex:^(NSInteger index) {
        
    }];
    [self addSubview:cycleView];
}

@end
