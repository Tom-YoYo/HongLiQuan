//
//  Data.h
//  SWWH
//
//  Created by 尚往文化 on 16/7/20.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

//code = 400;
@property (nonatomic, assign) NSInteger code;
//data = "<null>";
@property (nonatomic, strong) id data;
//msg = "\U7528\U6237\U4e0d\U5b58\U5728";
@property (nonatomic, copy) NSString *msg;
//time = 1498981186238;
@property (nonatomic, assign) NSUInteger time;

@end
