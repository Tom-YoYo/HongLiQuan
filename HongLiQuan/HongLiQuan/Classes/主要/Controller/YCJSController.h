//
//  YCJSController.h
//  SWWH
//
//  Created by 尚往文化 on 17/2/15.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "MBProgressHUD+MJ.h"

@interface YCJSController : UIViewController

@property (nonatomic, assign) CGFloat webViewH;

@property (strong, nonatomic) JSContext *context;

@property (nonatomic, copy) NSString *url;

//子类重写  要调用父类
- (void)setupContext;

//重新刷新页面
- (void)reloadData;

@end
