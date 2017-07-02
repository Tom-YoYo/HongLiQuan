//
//  Define.h
//  Xunbao2
//
//  Created by Jason on 15/7/20.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#ifndef Xunbao2_Define_h
#define Xunbao2_Define_h

#import "UIView+Extension.h"
#import "Function.h"
#import "UIView+YBLoading.h"

#ifdef DEBUG // 调试状态, 打开LOG功能
#define YBLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define YBLog(...)
#endif

// 弱引用
#define YBWeakSelf __weak typeof(self) weakSelf = self;

/**
 *  沙盒Document路径
 */
#define kDocumentPath ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject])

/**
 *  沙盒Cache路径
 */
#define kCachePath ([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject])
/**
 *  屏幕高度
 */
#define kScreenH ([UIScreen mainScreen].bounds.size.height)

/**
 *  屏幕宽度
 */
#define kScreenW ([UIScreen mainScreen].bounds.size.width)


/**
 *  弧度转角度
 */
#define kRADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

/**
 *  角度转弧度
 */
#define kDEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

// 颜色
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define KColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 随机色
#define kRandomColor kColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 是否为4inch
#define FourInch ([UIScreen mainScreen].bounds.size.height >= 568.0)

//导航栏主题颜色
#define kNavColor kColor(209,29,45)
#define kGrayColor KColorFromRGB(0x007aff)
#define kOrangeColor KColorFromRGB(0xffa200)
#define kBlueColor KColorFromRGB(0x007aff)
#define kGreenColor kColor(40,208,77)

#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define kVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]
#define kBundleIdentifier [[NSBundle mainBundle] infoDictionary][@"CFBundleIdentifier"]

//每一页的数据
#define kLimit @(10)

#define kLoadDataHeaderEnd if([weakSelf respondsToSelector:@selector(tableView)]){[weakSelf.view stop];[weakSelf.tableView stop]; [weakSelf.tableView.mj_header endRefreshing];}
#define kloadDataFooterEnd [weakSelf.tableView.mj_footer endRefreshing];

#define kSetupMJ_footer_loadData(selectorName) weakSelf.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{\
[weakSelf selectorName];\
}];\
if (arr.count<kLimit.integerValue) {\
    [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];\
} else {\
    [weakSelf.tableView.mj_footer resetNoMoreData];\
}\
\
[weakSelf.tableView reloadData];\
weakSelf.page=2;


#define kSetupMJ_footer_loadMoreData if (arr.count<kLimit.integerValue) {\
[weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];\
} else {\
    [weakSelf.tableView.mj_footer resetNoMoreData];\
}\
[weakSelf.tableView reloadData];\
weakSelf.page++;

//设置下拉刷新
#define kSetupRefreshNormalHeader self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{\
    [weakSelf loadData];\
}];

//设置返回按钮
#define kSetupBackItem UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];negativeSpacer.width = -5;self.navigationItem.leftBarButtonItems = @[negativeSpacer, [UIBarButtonItem backItemWithTarget:self action:@selector(back)]];

#define kHeightForSection 9

#define kAPI_URL @"http://testapp.hongliquan.com/hlq-app/"

#endif
