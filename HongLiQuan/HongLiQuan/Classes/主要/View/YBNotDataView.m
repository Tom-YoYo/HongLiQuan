//
//  YBNotDataView.m
//  SWWH
//
//  Created by 尚往文化 on 16/8/13.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "YBNotDataView.h"
#import "Define.h"

@implementation YBNotDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat w = 150;
        CGFloat h = 57;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2-w/2, self.height/2-h/2-100, w, h)];
        imgView.image = [UIImage imageNamed:@"logohui"];
        [self addSubview:imgView];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame), self.width, 30)];
        label.text = @"哎呀，没有找到任何东西呢～";
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        [self addSubview:label];
    }
    return self;
}

@end
