//
//  YBChartView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBChartXView.h"
#import "YBChartYView.h"

@interface YBChartView : UIView

- (instancetype)initWithFrame:(CGRect)frame style:(YBChartYViewStyle)style points:(NSArray<NSString *> *)points;

@end
