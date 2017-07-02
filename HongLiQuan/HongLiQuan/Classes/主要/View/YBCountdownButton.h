//
//  YBCountdownButton.h
//  YBCountdownButton
//
//  Created by Jason on 15/11/2.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBCountdownButton : UIButton

/**
 *  计时时间
 */
@property (nonatomic, assign) NSTimeInterval timeCount;
/**
 *  剩余时间
 */
@property (nonatomic, assign) NSTimeInterval surplusTimeCount;

/**
 *  开始倒计时
 */
- (void)start;

@end
