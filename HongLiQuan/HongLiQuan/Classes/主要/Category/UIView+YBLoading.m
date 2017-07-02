//
//  UIView+YBLoading.m
//  SWWH
//
//  Created by 尚往文化 on 16/8/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "UIView+YBLoading.h"
#import <objc/runtime.h>

static char *UIViewLoadingViewKey = "UIViewLoadingViewKey";
static char *UIViewNotDataViewKey = "UIViewNotDataViewKey";
static char *UIViewNetErrorViewKey = "UIViewNetErrorViewKey";

@implementation UIView (YBLoading)

- (void)setLoadingView:(YBLoadingView *)loadingView
{
    objc_setAssociatedObject(self, UIViewLoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBLoadingView *)loadingView
{
    return objc_getAssociatedObject(self, UIViewLoadingViewKey);
}

- (void)setNotDataView:(YBNotDataView *)notDataView
{
    objc_setAssociatedObject(self, UIViewNotDataViewKey, notDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBNotDataView *)notDataView
{
    return objc_getAssociatedObject(self, UIViewNotDataViewKey);
}

- (void)setNetErrorView:(YBNetErrorView *)netErrorView
{
    objc_setAssociatedObject(self, UIViewNetErrorViewKey, netErrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YBNetErrorView *)netErrorView
{
    return objc_getAssociatedObject(self, UIViewNetErrorViewKey);
}

- (void)loading:(CGRect)frame
{
    YBLoadingView *loadingView = [[YBLoadingView alloc] initWithFrame:frame];
    self.loadingView = loadingView;
    [self addSubview:self.loadingView];
}

- (void)notData:(CGRect)frame
{
    YBNotDataView *notDataView = [[YBNotDataView alloc] initWithFrame:frame];
    self.notDataView = notDataView;
    [self addSubview:self.notDataView];
}

- (void)netError:(CGRect)frame againBlock:(void (^)())againBlock
{
    YBNetErrorView *netErrorView = [[YBNetErrorView alloc] initWithFrame:frame againBlock:againBlock];
    self.netErrorView = netErrorView;
    [self addSubview:self.netErrorView];
}

- (void)stop
{
    [self.loadingView removeFromSuperview];
    [self.notDataView removeFromSuperview];
    [self.netErrorView removeFromSuperview];
}

@end
