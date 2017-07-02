//
//  YBAlertView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBAlertView.h"

@interface YBAlertView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;


@end

@implementation YBAlertView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    YBWeakSelf
    [[self.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf close];
        if (weakSelf.didClicked) {
            weakSelf.didClicked(0);
        }
    }];
    
    [[self.rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf close];
        if (weakSelf.didClicked) {
            weakSelf.didClicked(1);
        }
    }];
    
    [[self.allBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf close];
        if (weakSelf.didClicked) {
            weakSelf.didClicked(0);
        }
    }];
    
}

+ (void)show:(YBAlertViewType)type didClicked:(void (^)(NSInteger))didClicked
{
    switch (type) {
        case YBAlertViewTypeNoBindBank://没有绑定银行卡
        {
            YBAlertView *alertView = [YBAlertView alertView];
            alertView.didClicked = didClicked;
            alertView.imgView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e604", 80, kColor(45, 191, 43))];
            NSString *str = @"未绑定银行卡\n为确保收益到账，请先绑定银行卡";
            NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] initWithString:str];
            [mAttStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7, 15)];
            alertView.msgLabel.attributedText = mAttStr;
            alertView.allBtn.hidden = YES;
            [alertView.rightBtn setTitle:@"立即绑定" forState:UIControlStateNormal];
            [alertView show];
            break;
        }
        case YBAlertViewTypeBindBankSuccess://绑定银行卡成功
        {
            YBAlertView *alertView = [YBAlertView alertView];
            alertView.didClicked = didClicked;
            alertView.imgView.image = [UIImage imageWithInfo:YBIconInfoMake(@"\U0000e731", 80, kColor(45, 191, 43))];
            alertView.msgLabel.text = @"绑定银行卡成功";
            alertView.leftBtn.hidden = YES;
            alertView.rightBtn.hidden = YES;
            [alertView show];
            break;
        }
            
        default:
            break;
    }
}

@end
