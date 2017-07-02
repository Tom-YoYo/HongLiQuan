//
//  YBForgetController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBForgetController.h"
#import "YZMView.h"
#import "YBCountdownButton.h"
#import "YBSetPwdController.h"

@interface YBForgetController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *yzmTF;
@property (weak, nonatomic) IBOutlet YZMView *yzmView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;

@end

@implementation YBForgetController

- (IBAction)getCodeClick:(YBCountdownButton *)sender {
    
}

- (IBAction)nextClick:(UIButton *)sender {
    
    YBSetPwdController *setVC = [YBSetPwdController new];
    [self.navigationController pushViewController:setVC animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    [self setupUI];
}


- (void)setupUI
{
    self.nextBtn.layer.cornerRadius = 5;
    
    self.yzmView.code = @"7Sh9";
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
