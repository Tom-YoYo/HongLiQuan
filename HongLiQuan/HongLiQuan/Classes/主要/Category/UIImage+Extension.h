//
//  UIImage+Extension.h
//  YBing
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 YBing All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;



@end
