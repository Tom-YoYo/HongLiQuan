//
//  UIView+YBLoading.h
//  SWWH
//
//  Created by 尚往文化 on 16/8/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBLoadingView.h"
#import "YBNotDataView.h"
#import "YBNetErrorView.h"

@interface UIView (YBLoading)

@property (nonatomic, strong) YBLoadingView *loadingView;
@property (nonatomic, strong) YBNotDataView *notDataView;
@property (nonatomic, strong) YBNetErrorView *netErrorView;

//正在加载
- (void)loading:(CGRect)frame;
- (void)notData:(CGRect)frame;
- (void)netError:(CGRect)frame againBlock:(void(^)())againBlock;


- (void)stop;



@end
