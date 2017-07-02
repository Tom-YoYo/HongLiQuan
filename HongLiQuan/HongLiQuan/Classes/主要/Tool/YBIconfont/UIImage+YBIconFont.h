//
//  UIImage+YBIconFont.h
//  Iconfont封装
//
//  Created by 尚往文化 on 17/2/10.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBIconInfo.h"

@interface UIImage (YBIconFont)

+ (UIImage *)imageWithInfo:(YBIconInfo *)info;
+ (UIImage *)imageWithText:(NSString *)text color:(UIColor *)color size:(CGSize)size;


@end
