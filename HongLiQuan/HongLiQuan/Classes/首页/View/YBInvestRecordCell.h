//
//  YBInvestRecordCell.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBInvestRecordCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic, assign) NSInteger grad;

@end
