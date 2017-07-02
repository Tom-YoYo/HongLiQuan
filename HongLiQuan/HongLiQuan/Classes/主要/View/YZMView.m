
//
//  YZMView.m
//  验证码_Demo
//
//  Created by Jason on 15/8/31.
//  Copyright (c) 2015年 www.jizhan.com. All rights reserved.
//

#import "YZMView.h"

//随即色
#define kRandomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

#define kLineCount 6//线条的条数

#define kStarCount 100//星星的个数

#define kB_0X 10 //十进制或者十六进制


@interface YZMView ()

/**
 *  验证码拆开的各个字符
 */
@property (nonatomic, strong) NSMutableArray *codeArr;

@end

@implementation YZMView

- (NSMutableArray *)codeArr
{
    if (_codeArr == nil) {
        _codeArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _codeArr;
}

- (void)setCount:(NSInteger)count
{
    _count = count;

    //生成随机码
    for (int i = 0; i < count; i++) {
        NSInteger num = arc4random()%kB_0X;
        [self.codeArr addObject:[NSString stringWithFormat:@"%1lx", (long)num]];
    }
    
    _code = [self.codeArr componentsJoinedByString:@""];
}

- (void)setCode:(NSString *)code
{
    _code = code;
    if (self.codeArr.count) {
        [self.codeArr removeAllObjects];
    }
    for (int i=0; i<code.length; i++) {
        [self.codeArr addObject:[code substringWithRange:NSMakeRange(i, 1)]];
    }
    [self setNeedsDisplay];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = kRandomColor.CGColor;
        self.layer.borderWidth = 1;
        self.backgroundColor = [UIColor clearColor];
        
        self.userInteractionEnabled = YES;
        //添加手势  刷新
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    
    if (self.refresh) {
        self.refresh();
    }
//    if (self.codeArr.count) {
//        [self.codeArr removeAllObjects];
//    }
//    //生成随机码
//    for (int i = 0; i < self.count; i++) {
//        NSInteger num = arc4random()%kB_0X;
//        [self.codeArr addObject:[NSString stringWithFormat:@"%1lx", (long)num]];
//    }
//    
//    _code = [self.codeArr componentsJoinedByString:@""];
//    self.layer.borderColor = kRandomColor.CGColor;
//    
//    [self setNeedsDisplayInRect:self.bounds];
}

+ (instancetype)yzmViewWithFrame:(CGRect)frame count:(NSInteger)count
{
    YZMView *yzmView = [[YZMView alloc] initWithFrame:frame];
    yzmView.count = count;
    return yzmView;
}

+ (instancetype)yzmViewWithFrame:(CGRect)frame code:(NSString *)code
{
    YZMView *yzmView = [[YZMView alloc] initWithFrame:frame];
    yzmView.code = code;
    return yzmView;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    
    //随即画6条直线
    for (int i = 0; i < kLineCount; i++) {
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(arc4random()%(int)(w+1), arc4random()%(int)(h+1))];
        [bezierPath addLineToPoint:CGPointMake(arc4random()%(int)(w+1), arc4random()%(int)(h+1))];
        [kRandomColor setStroke];
        bezierPath.lineWidth = 1;
        [bezierPath stroke];
    }
    
    /*
    //随即生成100个星星
    CGSize size = [@"*" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    for (int i = 0; i < kStarCount; i++) {
        CGRect textRect = CGRectMake(arc4random()%(int)(w+1-size.width), arc4random()%(int)(h+1), size.width, size.height);
        [kRandomColor setFill];
        [@"*" drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    }
    */
    //验证码
    for (int i = 0; i < self.codeArr.count; i++) {
        CGSize codeSize = [self.codeArr[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
        CGRect textRect = CGRectMake(i*w/self.codeArr.count + arc4random()%(int)(w/self.codeArr.count+1-codeSize.width), arc4random()%(int)(h+1-codeSize.height), codeSize.width, codeSize.height);
        [[UIColor colorWithRed:arc4random()%100/255.0 green:arc4random()%150/255.0 blue:arc4random()%200/255.0 alpha:1] setFill];
        [self.codeArr[i] drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica" size: 20] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    }
}

@end
