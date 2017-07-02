//
//  YBSetPwdController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBSetPwdController.h"

@interface YBSetPwdController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *seePwdBtn;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF2;
@property (weak, nonatomic) IBOutlet UIButton *seePwdBtn2;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation YBSetPwdController
- (IBAction)confirmClick:(UIButton *)sender {
}
- (IBAction)seePwdClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passwordTF.secureTextEntry = !self.passwordTF.secureTextEntry;
}
- (IBAction)seePwdClick2:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passwordTF2.secureTextEntry = !self.passwordTF2.secureTextEntry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"重设密码";
    [self setupUI];
}

- (void)setupUI
{
    self.confirmBtn.layer.cornerRadius = 5;
    
    [self.seePwdBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e709", 22, [UIColor grayColor])] forState:UIControlStateNormal];
    [self.seePwdBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e6bc", 22, [UIColor grayColor])] forState:UIControlStateSelected];
    
    [self.seePwdBtn2 setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e709", 22, [UIColor grayColor])] forState:UIControlStateNormal];
    [self.seePwdBtn2 setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e6bc", 22, [UIColor grayColor])] forState:UIControlStateSelected];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
