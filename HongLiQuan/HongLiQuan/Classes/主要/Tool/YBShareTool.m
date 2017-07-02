//
//  YBShareTool.m
//  SWWH
//
//  Created by 尚往文化 on 16/11/16.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "YBShareTool.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDKUI.h>
#import "MBProgressHUD+MJ.h"

#import <ShareSDKConnector/ShareSDKConnector.h>
#import <WXApi.h>
#import "WeiboSDK.h"

#define kShareSDKAppKey @"1c687c442ba08"
//新浪
#define kWBAppkey @"178056328"
#define kWBAppsecret @"9b5ca60f4a8c22dd35008ab77a1379f2"
#define kWBRedirectUri @"http://www.baidu.com"
//QQ
#define kQQAppID @"1105523462"
#define kQQAppKey @"jE67kPrTvFqcbAGq"

//微信
#define kWXAppID @"wx2b17b1ed8029a0ed"
#define kWXAppSecret @"58f9b9361398e473bfd5ef8d32cc9a4f"

@implementation YBShareTool

+ (void)share:(NSString *)title content:(NSString *)content url:(NSString *)url images:(NSArray *)images
{
     [self share:title content:content url:url images:images success:nil fail:nil];
}

+ (void)share:(NSString *)title content:(NSString *)content url:(NSString *)url images:(NSArray *)images success:(void (^)())success fail:(void (^)())fail
{
     NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
     [shareParams SSDKEnableUseClientShare];
     [shareParams SSDKSetupShareParamsByText:content
                                      images:images
                                         url:[NSURL URLWithString:url]
                                       title:title
                                        type:SSDKContentTypeAuto];
     [ShareSDK showShareActionSheet:nil
                              items:@[ @(SSDKPlatformSubTypeWechatSession), @(SSDKPlatformSubTypeWechatTimeline),
                                       //                                     @(SSDKPlatformTypeSinaWeibo),
                                       @(SSDKPlatformTypeSMS)]
                        shareParams:shareParams
                onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                     switch (state) {
                          case SSDKResponseStateSuccess:
                          {
                               [MBProgressHUD showSuccess:@"分享成功"];
                               if (success) {
                                    success();
                               }
                               break;
                          }
                          case SSDKResponseStateFail:
                          {
                               [MBProgressHUD showSuccess:@"分享失败"];
                               if (fail) {
                                    fail();
                               }
                               break;
                          }
                          default:
                               break;
                     }
                }];
}

+ (void)setupConfigShareSDK
{
    
    [ShareSDK registerApp:kShareSDKAppKey
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeSMS)]
                 onImport:^(SSDKPlatformType platformType) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                             break;
                         default:
                             break;
                     }
                 }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:kWBAppkey
                                           appSecret:kWBAppsecret
                                         redirectUri:kWBRedirectUri
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:kWXAppID
                                       appSecret:kWXAppSecret];
                 break;
             default:
                 break;
         }
     }];
}


@end
