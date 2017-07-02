//
//  YBMyCouponController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/18.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBMyCouponController.h"
#import "YBMyCouponChildController.h"

@interface YBMyCouponController ()

@end

@implementation YBMyCouponController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的卡券";
    
    YBMyCouponChildController *childVC = [YBMyCouponChildController new];
     YBMyCouponChildController *childVC2 = [YBMyCouponChildController new];
     YBMyCouponChildController *childVC3 = [YBMyCouponChildController new];
    
    
    self.items = @[[YBBaseMenuControllerItem itemWithTitle:@"未使用" vc:childVC],
                   [YBBaseMenuControllerItem itemWithTitle:@"已使用" vc:childVC2],
                   [YBBaseMenuControllerItem itemWithTitle:@"已过期" vc:childVC3]];
}



@end
