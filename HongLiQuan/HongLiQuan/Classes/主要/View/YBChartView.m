//
//  YBChartView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBChartView.h"
#import "YBGridView.h"

@implementation YBChartView

- (instancetype)initWithFrame:(CGRect)frame style:(YBChartYViewStyle)style points:(NSArray<NSString *> *)points
{
    self = [super initWithFrame:frame];
    if (self) {
        YBChartXView *xView = [[YBChartXView alloc] initWithFrame:CGRectMake(30, self.height-30, self.width-30, 30)];
        [self addSubview:xView];
        
        YBChartYView *yView = [[YBChartYView alloc] initWithFrame:CGRectMake(0, 0, 30+(self.width-30)/7.0/2.0, self.height-30) style:style];
        [self addSubview:yView];
        
        CGFloat x = yView.width;
        CGFloat y = 0, h = 0;
        if (style==YBChartYViewStyleW) {
            y = (self.height-30)/7.0;
            h = (self.height-30)/7.0*6;
        } else if (style==YBChartYViewStyleYear) {
            y = (self.height-30)/8.0;
            h = (self.height-30)/8.0*7;
        }
    
        YBGridView *gridView = [[YBGridView alloc] initWithFrame:CGRectMake(x, y, (self.width-30)/7.0*6, h) style:style points:points];
        [self addSubview:gridView];
    }
    return self;
}



@end
