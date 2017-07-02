//
//  YBNavMenuView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBNavMenuView : UIView

@property (nonatomic, strong) NSArray<NSString *> *items;
@property (nonatomic, copy) void(^didClicked)(NSInteger index);


@property (nonatomic, assign) NSInteger selectIndex;

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<NSString *> *)items didClicked:(void(^)(NSInteger index))didClicked;



@end
