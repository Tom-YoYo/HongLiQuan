//
//  NSObject+runtime.h
//  SWWH
//
//  Created by 尚往文化 on 16/9/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (runtime)

+ (void)swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;
+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector;

@end

@interface NSArray (runtime)

@end

@interface NSMutableArray (runtime)

@end

@interface NSDictionary (runtime)

@end

@interface NSMutableDictionary (runtime)

@end

@interface UIButton (runtime)


/** 按钮重复点击的时间间隔,以秒为单位 **/
@property NSTimeInterval repeatEventInterval;

@end

@interface NSString (runtime)


@end

@interface NSURLResponse (runtime)

@end



