//
//  YBChartYView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YBChartYViewStyle) {
    YBChartYViewStyleW,//万元收益
    YBChartYViewStyleYear,//七日的年化收益
};

@interface YBChartYView : UIView

- (instancetype)initWithFrame:(CGRect)frame style:(YBChartYViewStyle)style;

@end
