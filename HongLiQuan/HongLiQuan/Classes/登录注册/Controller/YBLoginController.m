//
//  YBLoginController.m
//  HongLiQuan
//
//  Created by 游兵 on 2017/6/17.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "YBLoginController.h"
#import "YBRegisController.h"
#import "YBForgetController.h"

@interface YBLoginController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *seePwdBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation YBLoginController

- (IBAction)regisClick:(UIButton *)sender {
    [self.navigationController pushViewController:[YBRegisController new] animated:YES];
}

- (IBAction)forgetClick:(UIButton *)sender {
    YBForgetController *forgetVC = [YBForgetController new];
    [self.navigationController pushViewController:forgetVC animated:YES];
}

- (IBAction)loginClick:(UIButton *)sender {
    
    NSString *url = @"v1/doLogin";
    NSDictionary *params = @{@"userName":@"15817320872",
                             @"password":@"123456"};
    
    [YBHttpTool post:url params:params success:^(Data *obj) {
        YBLog(@"%@", obj.msg);
    } failure:^(NSError *error) {
        
    }];
}

- (IBAction)seePwdClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    self.passwordTF.secureTextEntry = !self.passwordTF.secureTextEntry;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户登录";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithInfo:YBIconInfoMake(@"\U0000e62a", 22, [UIColor whiteColor])] style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    
    [self setupUI];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupUI
{
    self.loginBtn.layer.cornerRadius = 5;
    
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
