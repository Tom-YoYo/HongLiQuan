//
//  YBMeHeaderView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/16.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBMeHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *userBtn;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImgVIew;
@property (weak, nonatomic) IBOutlet UIButton *moneyBtn;
@property (weak, nonatomic) IBOutlet UILabel *messageBadgLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *myBankBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;
@property (weak, nonatomic) IBOutlet UIButton *moneyedBtn;
@property (weak, nonatomic) IBOutlet UIButton *recordDescBtn;

@property (weak, nonatomic) IBOutlet UILabel *markLabel;
+ (UIView *)headerView;

@end
