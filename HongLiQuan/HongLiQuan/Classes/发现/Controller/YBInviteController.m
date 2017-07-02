//
//  YBInviteController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBInviteController.h"
#import "YBShareTool.h"

@interface YBInviteController ()

@property (nonatomic, assign) CGRect btnRect;

@end

@implementation YBInviteController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"推荐有奖";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"奖励规则" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    
    
    CGFloat imgW = 750;
    CGFloat imgH = 997;
    CGFloat imgS = 997/750.0;
    CGFloat screenS = (kScreenH-64)/kScreenW;
    
    CGFloat imgBtnX = 120;
    CGFloat imgBtnY = 865;
    CGFloat imgBtnW = imgW - 240;
    CGFloat imgBtnH = 95;
    
    CGFloat imgNewW = 0.0;
    CGFloat imgNewH = 0.0;
    if (screenS < imgS) {
        imgNewH = kScreenH-64;
        imgNewW = imgW*imgNewH/imgH;
        
        CGFloat s = imgNewH/imgH;//放大的倍数
        CGFloat clipX = kScreenW-imgNewW;
        
        imgBtnY *= s;
        imgBtnW *= s;
        imgBtnH *= s;
        imgBtnX *= s;
        imgBtnX -= (clipX / 2.0);
    } else {
        imgNewW = kScreenW;
        imgNewH = imgH*imgNewW/imgW;
        
        CGFloat s = imgNewH/imgH;//放大的倍数
        CGFloat clipY = kScreenH-64-imgNewH;
        
        imgBtnY *= s;
        imgBtnW *= s;
        imgBtnH *= s;
        imgBtnX *= s;
        imgBtnY += (clipY / 2.0);
    }
    
    self.btnRect = CGRectMake(imgBtnX, imgBtnY, imgBtnW, imgBtnH);
}

- (void)rightClick
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    if (CGRectContainsPoint(self.btnRect, point)) {
        [YBShareTool share:@"title" content:@"content" url:@"" images:@[]];
    }
}

@end
