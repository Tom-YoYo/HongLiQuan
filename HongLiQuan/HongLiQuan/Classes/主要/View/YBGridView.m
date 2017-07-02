//
//  YBGridView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBGridView.h"

@interface YBGridView ()

@property (nonatomic, assign) YBChartYViewStyle style;
@property (nonatomic, strong) NSArray<NSString *> *points;

@end

@implementation YBGridView

- (instancetype)initWithFrame:(CGRect)frame style:(YBChartYViewStyle)style points:(NSArray<NSString *> *)points
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.points = points;
        self.style = style;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //画网格
    [self drawGrid];
    
    //画线
    [self drawLine];
    //画点
    [self drawPoint];
    
}

- (void)drawGrid
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    if (self.style==YBChartYViewStyleYear) {
        CGFloat h = self.height/7.0;
        for (int i = 0; i<8; i++) {
            CGFloat y = i*h;
            [bezierPath moveToPoint:CGPointMake(0, y)];
            [bezierPath addLineToPoint:CGPointMake(self.width, y)];
        }
        [[UIColor groupTableViewBackgroundColor] setStroke];
        [bezierPath stroke];
    } else if (self.style==YBChartYViewStyleW) {
        CGFloat h = self.height/6.0;
        for (int i = 0; i<7; i++) {
            CGFloat y = i*h;
            [bezierPath moveToPoint:CGPointMake(0, y)];
            [bezierPath addLineToPoint:CGPointMake(self.width, y)];
        }
        [[UIColor groupTableViewBackgroundColor] setStroke];
        [bezierPath stroke];
    }

}

- (void)drawLine
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGFloat w =self.width/6.0;
    
    [self.points enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx==0) {
            [bezierPath moveToPoint:CGPointMake(0, [self getY:[obj floatValue]])];
        } else {
            [bezierPath addLineToPoint:CGPointMake(idx*w, [self getY:[obj floatValue]])];
        }
    }];
    [[UIColor redColor] setStroke];
    [bezierPath stroke];
}

- (void)drawPoint
{
    CGFloat w =self.width/6.0;
    
    [self.points enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        CGFloat x = idx*w;
        if (idx==0) {
            x+=2;
        } else if (idx==self.points.count-1) {
            x-=2;
        }
        
        [bezierPath addArcWithCenter:CGPointMake(x, [self getY:[obj floatValue]]) radius:2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
        
        [[UIColor redColor] setFill];
        [bezierPath fill];
    }];
}

- (CGFloat)getY:(CGFloat)point
{
    if (self.style==YBChartYViewStyleYear) {
        CGFloat y = self.height/7;
        return self.height-point*y/1.0;
    } else if (self.style==YBChartYViewStyleW) {
        CGFloat y = self.height/6;
        return self.height-point*y/0.3;
    }
    return 0;
}

@end
