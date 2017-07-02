//
//  UITabBar+badge.h
//  XHGY_client
//
//  Created by 尚往文化 on 17/5/4.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

- (void)showBadgeOnItmIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index;

@end
