//
//  YBMyInvestController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMyInvestController.h"
#import "YBMyInvesttingController.h"

@interface YBMyInvestController ()

@end

@implementation YBMyInvestController

- (void)dealloc
{
    YBLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的投资";
    
    YBMyInvesttingController *investVC = [YBMyInvesttingController new];
    YBMyInvesttingController *investVC2 = [YBMyInvesttingController new];
    investVC2.type = 1;
    self.items = @[[YBBaseMenuControllerItem itemWithTitle:@"投资中" vc:investVC], [YBBaseMenuControllerItem itemWithTitle:@"已结算" vc:investVC2]];
    
}


@end
