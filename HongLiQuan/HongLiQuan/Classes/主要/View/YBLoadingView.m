//
//  YBLoadingView.m
//  SWWH
//
//  Created by 尚往文化 on 16/8/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "YBLoadingView.h"
#import <UIImage+GIF.h>
#import "Define.h"

@implementation YBLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat w = 200;
        CGFloat h = 200*179/483.0;
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2-w/2, self.height/2-h/2-100, w, h)];
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Loading_icon" ofType:@"gif"]];
        imgView.image = [UIImage sd_animatedGIFWithData:data];
        [self addSubview:imgView];
    }
    return self;
}

@end
