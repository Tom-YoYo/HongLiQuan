//
//  YBBaseMenuController.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBBaseController.h"

@interface YBBaseMenuControllerItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIViewController *vc;

+ (instancetype)itemWithTitle:(NSString *)title vc:(UIViewController *)vc;

@end

@interface YBBaseMenuController : YBBaseController

@property (nonatomic, strong) NSArray<YBBaseMenuControllerItem *> *items;

@end
