//
//  YCJSController.m
//  HLQ
//
//  Created by 尚往文化 on 17/2/15.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "YCJSController.h"
#import "UIAlertView+Block.h"
#import "UIImage+Color.h"
#import "NSUserDefaults+Extension.h"
#import <WebKit/WebKit.h>
#import "UINavigationController+YB.h"

@interface YCJSController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation YCJSController

- (void)dealloc
{
     YBLog(@"%s", __FUNCTION__);
}

- (void)setWebViewH:(CGFloat)webViewH
{
    _webViewH = webViewH;
    self.webView.frame = CGRectMake(0, 0, kScreenW, webViewH);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupUI];
}

- (void)reloadData
{
     [self setupUI];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromContextWithColor:[kNavColor colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.alpha = 1;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor]};
}

- (void)setupUI
{
     self.context = nil;
     [self.webView removeFromSuperview];
     self.webView = nil;
     
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64)];
    self.webView.scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.webView.delegate = self;
    self.webView.scrollView.bounces = NO;
        
    self.context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
     [self setupContext];
     
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}

- (void)setupContext
{
     YBWeakSelf
     //获取版本信息
     self.context[@"HLQ_IOS_SDK_getVersion"] = (NSString *)^() {
          return [weakSelf getVersion];
     };
    
     //跳转页面
     self.context[@"HLQ_IOS_SDK_push"] = (id)^(NSString *url) {
          [weakSelf push:url];
     };
     self.context[@"HLQ_IOS_SDK_quit_push"] = (id)^(NSString *url) {
          [weakSelf quit_push:url];
     };
     //跳转页面
     self.context[@"HLQ_IOS_SDK_push_index"] = (id)^(NSString *url, NSInteger index) {
          [weakSelf push_index:url index:index];
     };
     
     //拨打电话号码
     self.context[@"HLQ_IOS_SDK_callPhoneCode"] = (id)^(NSString *phone) {
          [weakSelf callPhoneCode:phone];
     };
    
    
     //提示
     self.context[@"HLQ_IOS_SDK_show"] = (id)^(NSString *message) {
          [weakSelf showMessage:message];
     };
     
     //背景颜色
     self.context[@"HLQ_IOS_SDK_setNavBgColor"] = (id)^(NSString *color) {
          [weakSelf setNavBgColor:color];
     };
     
}

- (void)back
{
     if (self.webView.canGoBack) {
          [self.webView goBack];
     } else {
          [self.navigationController popViewControllerAnimated:YES];
     }
}

- (void)setUrl:(NSString *)url
{
    _url = [url copy];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.view stop];
    [self.view loading:CGRectMake(0, 0, kScreenW, kScreenH-64)];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view stop];
    NSString *str = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    YBLog(@"UserAgent = %@", str);
    //禁止长按弹出图片的地址等
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitTouchCallout='none';"];
    //禁止长按复制
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    NSString *title = [self.context evaluateScript:@"document.title"].toString;
    self.navigationItem.title = title;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.view stop];
    YBLog(@"%@", error.localizedDescription);
}

- (void)alert:(NSString *)title message:(NSString *)message  buttonIndex:(NSString *)buttonIndex cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    YBWeakSelf
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [UIAlertView alertWithTitle:title message:message buttonIndex:^(NSInteger index) {
            [weakSelf.context evaluateScript:[NSString stringWithFormat:@"%@(%zi)", buttonIndex, index]];
        } cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle];
        [alertView show];
    });
}

- (void)showMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showSuccess:message];
    });
}

- (void)callPhoneCode:(NSString *)phone
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIAlertView alertWithTitle:nil message:[NSString stringWithFormat:@"是否拨打电话%@", phone] buttonIndex:^(NSInteger index) {
            if (index == 1) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phone]]];
            }
        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定"] show];
    });
}

- (void)push:(NSString *)url
{
    YCJSController *jsVC = [[YCJSController alloc] init];
    jsVC.url = url;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:jsVC animated:YES];
    });
}

- (void)quit_push:(NSString *)url
{
    YCJSController *jsVC = [[YCJSController alloc] init];
    jsVC.url = url;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController yb_pushViewController:jsVC animated:YES];
    });
}

//index表示   push之后的控制器 back返回到第几个控制器  index == 1的时候为跟控制器
- (void)push_index:(NSString *)url index:(NSInteger)index
{
     YCJSController *jsVC = [[YCJSController alloc] init];
     jsVC.url = url;
     dispatch_async(dispatch_get_main_queue(), ^{
          
          NSMutableArray *vcs = [self.navigationController.viewControllers mutableCopy];
          if (vcs.count-index>0) {
               [vcs removeObjectsInRange:NSMakeRange(index, vcs.count-index)];
          }
          [vcs addObject:jsVC];
          [self.navigationController setViewControllers:vcs animated:YES];
     });
}

- (void)setNavBgColor:(NSString *)color
{
    NSUInteger outValue = 0;
    [[NSScanner scannerWithString:color]scanHexInt:&outValue];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromContextWithColor:KColorFromRGB(outValue)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.alpha = .98;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor]};
}

-  (NSString *)getVersion
{
    return kVersion;
}

@end
