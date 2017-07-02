//
//  YBPayMoneyCell.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/7/2.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBPayMoneyCell : UITableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *moneyTF;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
