//
//  YBHomeHeaderView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/1.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBHomeHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *regisNumLabel;

+ (instancetype)homeHeaderView;

@end
