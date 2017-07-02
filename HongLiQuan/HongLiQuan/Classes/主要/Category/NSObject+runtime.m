//
//  NSObject+runtime.m
//  SWWH
//
//  Created by 尚往文化 on 16/9/10.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>
#import <objc/message.h>

static BOOL CrashEnable = NO;//打开就回崩溃

@implementation NSObject (runtime)

+ (void)swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getClassMethod(class, otherSelector);
    Method originMehtod = class_getClassMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getInstanceMethod(class, otherSelector);
    Method originMehtod = class_getInstanceMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

@end

@implementation NSArray (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:@selector(objectAtIndex:) otherSelector:@selector(yb_objectAtIndex:)];
    });
}

- (id)yb_objectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self yb_objectAtIndex:index];
    } else {
        if (CrashEnable) {
            NSAssert(NO, @"数组越界了。。。。。。。");
        }
        return nil;
    }
}

@end

@implementation NSMutableArray (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(insertObject:atIndex:) otherSelector:@selector(yb_insertObject:atIndex:)];
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(objectAtIndex:) otherSelector:@selector(yb_objectAtIndex:)];
        [self swizzleInstanceMethod:NSClassFromString(@"__NSPlaceholderArray") originSelector:@selector(initWithObjects:count:) otherSelector:@selector(yb_initWithObjects:count:)];
    });
}

- (void)yb_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject != nil && index<=self.count) {
        [self yb_insertObject:anObject atIndex:index];
    } else {
        if (CrashEnable) {
            NSAssert(NO, @"插入的对象是空或者插入的索引越界了。。。");
        }
    }
}

- (id)yb_objectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self yb_objectAtIndex:index];
    } else {
        if (CrashEnable) {
            NSAssert(NO, @"数组越界了。。。。。。。");
        }
        return nil;
    }
}

- (instancetype)yb_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
{
    for (int i=0; i<cnt; i++) {
        if (objects[i] == nil) {
            if (CrashEnable) {
                NSAssert(NO, @"插入的对象是空的。。。");
            }
            return nil;
        }
    }
    return [self yb_initWithObjects:objects count:cnt];
}

@end

@implementation NSDictionary (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSPlaceholderDictionary") originSelector:@selector(initWithObjects:forKeys:count:) otherSelector:@selector(yb_initWithObjects:forKeys:count:)];
    });
}

- (instancetype)yb_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    for (int i=0; i<cnt; i++) {
        if (objects[i] == nil) {
            if (CrashEnable) {
                NSAssert(NO, @"插入的对象是空的。。。");
            }
            return nil;
        }
    }
    return [self yb_initWithObjects:objects forKeys:keys count:cnt];
}

@end

@implementation NSMutableDictionary (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(setObject:forKey:) otherSelector:@selector(yb_setObject:forKey:)];
    });
}

- (void)yb_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject!=nil) {
        [self yb_setObject:anObject forKey:aKey];
    } else {
        if (CrashEnable) {
            NSAssert(NO, @"设置了字典的value为nil");
        }
    }
}

@end

@interface UIButton ()
/** 保存1970年到现在的时间(timeIntervalSince1970)，时间只会越来越大 */
@property NSTimeInterval previousClickTime; // 不让外界访问
@end

const char *repeatEventIntervalKey  = "repeatEventIntervalKey";
const char *previousClickTimeKey      = "previousClickTimeKey";

@implementation UIButton (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:[self class] originSelector:@selector(sendAction:to:forEvent:) otherSelector:@selector(yb_sendAction:to:forEvent:)];
    });
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
}

- (void)setRepeatEventInterval:(NSTimeInterval)repeatEventInterval {
    
    objc_setAssociatedObject(self, repeatEventIntervalKey, @(repeatEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)repeatEventInterval {
    
    NSTimeInterval repeatEventIn = (NSTimeInterval)[objc_getAssociatedObject(self, repeatEventIntervalKey) doubleValue];
    
    // 如果外界设置的重复点击的时间间隔大于0，就按照用户设置的去处理，如果用户设置的间隔时间小于或等于0，就按照无间隔处理
    if (repeatEventIn<=0) {
        return 0;
    }
    return repeatEventIn;
}

- (void)setPreviousClickTime:(NSTimeInterval)previousClickTime {
    
    objc_setAssociatedObject(self, previousClickTimeKey, @(previousClickTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSTimeInterval)previousClickTime {
    
    NSTimeInterval previousEventTime = [objc_getAssociatedObject(self, previousClickTimeKey) doubleValue];
    if (previousEventTime != 0) {
        
        return previousEventTime;
    }
    
    return 1;
}

- (void)yb_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([self isKindOfClass:NSClassFromString(@"CUShutterButton")] || [self isKindOfClass:NSClassFromString(@"CMKShutterButton")]) {
        [self yb_sendAction:action to:target forEvent:event];return;
    }
    NSTimeInterval time = [[[NSDate alloc] init] timeIntervalSince1970];
    if (time - self.previousClickTime < self.repeatEventInterval) {
        return;
    }
    
    // 如果间隔时间大于0
    if (self.repeatEventInterval > 0) {
        self.previousClickTime = [[[NSDate alloc] init] timeIntervalSince1970];
    }
    // 已在load中与系统的sendAction:to:forEvent:方法交换方法实现，所以下面调用的还是系统的方法
    [self yb_sendAction:action to:target forEvent:event];
}

@end

@implementation NSString (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"NSPlaceholderMutableString") originSelector:@selector(initWithString:) otherSelector:@selector(yb_initWithString:)];
    });
}

- (NSString *)yb_initWithString:(NSString *)str
{
    if (str==nil) {
        return nil;
    }
    return [self yb_initWithString:str];
}

@end

@implementation NSURLResponse(runtime)

- (NSInteger)statusCode
{
    YBLog(@"----------------------------------------------\\---------%s-----------%@", __FUNCTION__, self.class);
    return 0;
}

@end
