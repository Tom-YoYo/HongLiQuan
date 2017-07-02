//
//  YBRegisController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBRegisController.h"
#import "YBCountdownButton.h"

@interface YBRegisController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UIButton *seePwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *regisbtn;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation YBRegisController
- (IBAction)seePwdClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.passwordTF.secureTextEntry = !self.passwordTF.secureTextEntry;
}

- (IBAction)getCodeClick:(YBCountdownButton *)sender {
}
- (IBAction)protocolClick:(UIButton *)sender {
}
- (IBAction)regisClick:(UIButton *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户注册";
    [self setupUI];
}

- (void)setupUI
{
    self.regisbtn.layer.cornerRadius = 5;
    
    [self.seePwdBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e709", 22, [UIColor grayColor])] forState:UIControlStateNormal];
    [self.seePwdBtn setImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e6bc", 22, [UIColor grayColor])] forState:UIControlStateSelected];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


@end
