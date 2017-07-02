//
//  YBShareTool.h
//  SWWH
//
//  Created by 尚往文化 on 16/11/16.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBShareTool : NSObject

+ (void)setupConfigShareSDK;

+ (void)share:(NSString *)title content:(NSString *)content url:(NSString *)url images:(NSArray *)images;

+ (void)share:(NSString *)title content:(NSString *)content url:(NSString *)url images:(NSArray *)images success:(void(^)())success fail:(void(^)())fail;

@end
