//
//  YBHQDetailCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBHQDetailCell.h"
#import "YBChartView.h"
#import "YBNavMenuView.h"

@interface YBHQDetailCell ()

@property (nonatomic, strong) YBChartView *yearChartView;
@property (nonatomic, strong) YBChartView *wChartView;

@end

@implementation YBHQDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:@"万元收益\n1.6931元"];
    [mAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(5, 7)];
    NSMutableAttributedString *selectmAttStr = [[NSMutableAttributedString alloc] initWithString:@"万元收益\n1.6931元"];
    [selectmAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(5, 7)];
    [selectmAttStr addAttribute:NSForegroundColorAttributeName value:kNavColor range:NSMakeRange(0, 12)];
    
    NSMutableAttributedString *mAttStr2 = [[NSMutableAttributedString alloc] initWithString:@"近七日的年化收益\n6.18%"];
    [mAttStr2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(9, 5)];
    NSMutableAttributedString *selectmAttStr2 = [[NSMutableAttributedString alloc] initWithString:@"近七日的年化收益\n6.18%"];
    [selectmAttStr2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(9, 5)];
    [selectmAttStr2 addAttribute:NSForegroundColorAttributeName value:kNavColor range:NSMakeRange(0, 14)];
    YBWeakSelf
    YBNavMenuView *menuView = [[YBNavMenuView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44) items:@[@"万元收益\n1.6931元", @"近七日的年化收益\n6.18%"] didClicked:^(NSInteger index) {
        if (index==0) {
            weakSelf.yearChartView.hidden = YES;
            weakSelf.wChartView.hidden = NO;
        } else if (index==1) {
            weakSelf.yearChartView.hidden = NO;
            weakSelf.wChartView.hidden = YES;
        }
    }];
    [self.contentView addSubview:menuView];
    UIButton *btn1 = [menuView viewWithTag:10];
    [btn1 setAttributedTitle:mAttStr forState:UIControlStateNormal];
    [btn1 setAttributedTitle:selectmAttStr forState:UIControlStateSelected];
    
    UIButton *btn2 = [menuView viewWithTag:11];
    [btn2 setAttributedTitle:mAttStr2 forState:UIControlStateNormal];
    [btn2 setAttributedTitle:selectmAttStr2 forState:UIControlStateSelected];
    
    
    self.yearChartView  = [[YBChartView alloc]  initWithFrame:CGRectMake(0, menuView.height, kScreenW, 250) style:YBChartYViewStyleYear points:@[@"6.0", @"6.2", @"6.4", @"6.3", @"6.34", @"6.35", @"6.45"]];
    [self.contentView addSubview:self.yearChartView];
    self.yearChartView.hidden = YES;
    
    self.wChartView  = [[YBChartView alloc]  initWithFrame:CGRectMake(0, menuView.height, kScreenW, 250) style:YBChartYViewStyleW points:@[@"1.5",@"1.53",@"1.55",@"1.5",@"1.53",@"1.55",@"1.57"]];
    [self.contentView addSubview:self.wChartView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
