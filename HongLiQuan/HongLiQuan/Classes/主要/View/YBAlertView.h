//
//  YBAlertView.h
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBBaseAlertView.h"

typedef NS_ENUM(NSInteger, YBAlertViewType) {
    YBAlertViewTypeNoBindBank = 1,//没有绑定银行卡
    YBAlertViewTypeBindBankSuccess = 2,//绑定银行卡成功
};

@interface YBAlertView : YBBaseAlertView

+ (void)show:(YBAlertViewType)type didClicked:(void(^)(NSInteger index))didClicked;

@end
