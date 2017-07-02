//
//  YBNetErrorView.m
//  SWWH
//
//  Created by 尚往文化 on 16/8/19.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "YBNetErrorView.h"
#import "Define.h"

@implementation YBNetErrorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat w = 56;
        CGFloat h = 80;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2-w/2, self.height/2-h/2-100, w, h)];
        imgView.image = [UIImage imageNamed:@"iconfont-bukaixin"];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imgView];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame)+16, self.width, 40)];
        label.numberOfLines = 2;
        label.text = @"哎呀！网络好像有点问题，请检查\n您的网络，重新加载。";
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        [self addSubview:label];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.backgroundColor = kBlueColor;
        button.frame = CGRectMake(self.width/2-120/2, CGRectGetMaxY(label.frame)+100, 120, 44);
        button.layer.cornerRadius = 5;
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"重试" forState:UIControlStateNormal];
        [self addSubview:button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame againBlock:(void (^)())againBlock
{
    self = [self initWithFrame:frame];
    if (self) {
        self.againBlock = againBlock;
    }
    return self;
}

- (void)click:(UIButton *)btn
{
    if (self.againBlock) {
        self.againBlock();
    }
}

@end
