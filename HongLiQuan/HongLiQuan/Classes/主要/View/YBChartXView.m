//
//  YBChartXView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBChartXView.h"
#import "NSDate+YB.h"
#import "NSDate+EVTUtilsExtras.h"

@implementation YBChartXView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat w = self.width/7;
        for (int i = 0; i<7; i++) {
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(w*i, 0, w, self.height)];
            label.textColor = [UIColor grayColor];
            label.font = [UIFont systemFontOfSize:12];
            label.textAlignment = NSTextAlignmentCenter;
            NSDate *date = [[NSDate today] dateByAddingDays:i-6];
            label.text = [NSDate dateStringWithDate:date dateFormat:@"MM.dd"];
            [self addSubview:label];
            
        }
    }
    return self;
}

@end
