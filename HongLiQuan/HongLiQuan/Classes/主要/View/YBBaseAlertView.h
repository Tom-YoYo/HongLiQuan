//
//  YBAlertView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBBaseAlertView : UIView

@property (nonatomic, copy) void(^didClicked)(NSInteger index);

- (void)show;
- (void)close;
+ (instancetype)alertView;

@end
