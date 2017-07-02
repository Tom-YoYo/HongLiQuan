//
//  YBChartYView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBChartYView.h"

@implementation YBChartYView

- (instancetype)initWithFrame:(CGRect)frame style:(YBChartYViewStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        if (style==YBChartYViewStyleW) {
            CGFloat h = self.height/7;
            for (int i = 0; i<7; i++) {
                [self creatLabel:[NSString stringWithFormat:@"%.1f", (6-i)*0.3] frame:CGRectMake(0, i*h+h/2, self.width, h)];
            }

        } else if (style==YBChartYViewStyleYear) {
            CGFloat h = self.height/8;
            for (int i = 0; i<8; i++) {
                [self creatLabel:[NSString stringWithFormat:@"%.2f%%", 7-i*1.0] frame:CGRectMake(0, i*h+h/2, self.width, h)];
            }
        }
    }
    return self;
}

- (UILabel *)creatLabel:(NSString *)text frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    [self addSubview:label];
    return label;
}

@end
