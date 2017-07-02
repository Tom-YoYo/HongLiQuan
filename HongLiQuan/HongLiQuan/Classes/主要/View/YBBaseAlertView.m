//
//  YBAlertView.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBBaseAlertView.h"

@interface YBBaseAlertView ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation YBBaseAlertView

- (void)dealloc
{
    YBLog(@"%s", __FUNCTION__);
}

- (UIView *)bgView
{
    if (_bgView==nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _bgView.alpha = .4;
        _bgView.backgroundColor = [UIColor blackColor];
        
    }
    return _bgView;
}

+ (instancetype)alertView
{
    YBBaseAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] lastObject];
    alertView.frame = CGRectMake(0, 0, kScreenW-60, 200);
    return alertView;
}

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self.bgView];
    self.x = kScreenW/2 - self.width/2;
    self.y = kScreenH/2 - self.height/2;
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    [window addSubview:self];
}

- (void)close
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    
    [self removeFromSuperview];
}


@end
