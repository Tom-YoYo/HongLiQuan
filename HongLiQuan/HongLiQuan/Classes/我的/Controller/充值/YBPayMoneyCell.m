//
//  YBPayMoneyCell.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/7/2.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBPayMoneyCell.h"

@implementation YBPayMoneyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.moneyTF.delegate = self;
    [[self.moneyTF rac_signalForSelector:@selector(textFieldShouldReturn:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(id  _Nullable x) {
        UITextField *tf = [x first];
        [tf resignFirstResponder];        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    UIBezierPath *b = [UIBezierPath bezierPath];
    [b moveToPoint:CGPointMake(0, self.height-34)];
    [b addLineToPoint:CGPointMake(self.width, self.height-34)];
    [[UIColor groupTableViewBackgroundColor] setStroke];
    [b stroke];
}

@end
