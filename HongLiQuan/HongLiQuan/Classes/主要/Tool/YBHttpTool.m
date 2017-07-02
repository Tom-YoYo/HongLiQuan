 //
//  YBHttp.m
//  Wanyingjinrong
//
//  Created by Jason on 15/11/17.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import "YBHttpTool.h"
#import "YBMD5.h"
#import "UserManager.h"
#import "MBProgressHUD+MJ.h"
#import <objc/runtime.h>
#import "NSUserDefaults+Extension.h"
#import <MJExtension.h>
#import "UserTool.h"
#import "UserTool.h"
#import "LLPayUtil.h"

#define kFileNameKey @"kFileNameKey"
#define kResultKey @"kResultKey"



static char *NSErrorStatusCodeKey = "NSErrorStatusCodeKey";

@implementation NSError (YBHttp)

- (void)setStatusCode:(NSInteger)statusCode
{
    objc_setAssociatedObject(self, NSErrorStatusCodeKey, @(statusCode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)statusCode
{
    return [objc_getAssociatedObject(self, NSErrorStatusCodeKey) integerValue];
}

@end


@implementation YBHttpTool

+ (void)errorHandle:(NSURLSessionDataTask * _Nullable)task error:(NSError * _Nonnull)error failure:(void (^)(NSError *))failure
{
    
    [MBProgressHUD hideHUD];
    YBLog(@"请求出错了------%@", task.originalRequest.URL.absoluteString);
    YBLog(@"请求出错了------%@", error.localizedDescription);
    
    NSInteger statusCode = 0;
    if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        statusCode = response.statusCode;
        
        error.statusCode = statusCode;
    }
    
    if (failure) {
        failure(error);
    }
    
    if (statusCode == 401) {//token过期
        
    } else if (statusCode == 0) {//没有网络
        
        if([UIApplication sharedApplication].windows.count!=0) {
            [MBProgressHUD showError:@"没有网络，请检查网络设置！"];
        }
    } else if (statusCode == 500) {//参数错误
        
    } else if (statusCode == 404) {
        
    } else if (statusCode == 400) {

    }
    
    
}

+ (NSString *)fileName:(NSString *)url params:(NSDictionary *)params
{
    NSMutableString *mStr = [NSMutableString stringWithString:url];
    if (params != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [mStr appendString:str];
    }
    return mStr;
}

+ (AFHTTPSessionManager *)sessionManager
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"image/png", nil];
//    设置请求超时
    sessionManager.requestSerializer.timeoutInterval = 30;
    //设置请求头
    UserManager *manager = [UserManager sharedManager];
    if (manager.user.ticket.length) {
        [sessionManager.requestSerializer setValue:manager.user.ticket forHTTPHeaderField:@"ticket"];
        YBLog(@"----------%@", manager.user.ticket);
    }
    
    
    /*****************************HTTPS*****************************/
    
    //    [sessionManager setSecurityPolicy:[self customSecurityPolicy]];
    
    
    
    return sessionManager;
}

+ (AFSecurityPolicy *)customSecurityPolicy
{
    //先导入证书，找到证书的路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"s" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    //AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}
    
+ (NSDictionary *)getCache:(YBCacheType)cacheType url:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success
{
    //缓存数据的文件名
    NSString *fileName = [self fileName:url params:params];
    NSData *data = [YBCacheTool getCacheFileName:fileName];
    
    BOOL result = NO;
    
    if (data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        Data *data = [Data mj_objectWithKeyValues:dict];
        if (cacheType == YBCacheTypeReloadIgnoringLocalCacheData) {//忽略缓存，重新请求
            
        } else if (cacheType == YBCacheTypeReturnCacheDataDontLoad) {//有缓存就用缓存，没有缓存就不发请求，当做请求出错处理（用于离线模式）
            
        } else if (cacheType == YBCacheTypeReturnCacheDataElseLoad) {//有缓存就用缓存，没有缓存就重新请求(用于数据不变时)
            if (success) {
                success(data);
            }
            result = YES;
            
        } else if (cacheType == YBCacheTypeReturnCacheDataThenLoad) {///有缓存就先返回缓存，同步请求数据
            if (success) {
                success(data);
            }
        } else if (cacheType == YBCacheTypeReturnCacheDataExpireThenLoad) {//有缓存 判断是否过期了没有 没有就返回缓存
            //判断是否过期
            if (![YBCacheTool isExpire:fileName]) {
                if (success) {
                    success(data);
                }
                result = YES;
            }
        }
    }
    return @{kFileNameKey:fileName,
             kResultKey:@(result)};
}

+ (void)getDateSuccess:(void (^)(Data *obj))success failure:(void (^)(NSError *error))failure
{
    NSString *url = @"time/currentTime";
    [self post:url params:nil success:success failure:failure];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params cacheType:(YBCacheType)cacheType success:(void (^)(Data *))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *sessionManager = [self sessionManager];
    NSString *httpStr = [[kAPI_URL stringByAppendingString:url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    //缓存数据的文件名 data
    NSDictionary *dataDict = [self getCache:cacheType url:url params:params success:success];
    NSString *fileName = dataDict[kFileNameKey];
    if ([dataDict[kResultKey] boolValue]) return;
    
    YBWeakSelf
    [sessionManager POST:httpStr parameters:[self setupParams:params] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Data *data = [Data mj_objectWithKeyValues:responseObject];
        
        if (data.code==200) {
            //缓存数据
            NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];

            [YBCacheTool cacheForData:data fileName:fileName];
        }
        
        if (success) {
            success(data);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [weakSelf errorHandle:task error:error failure:failure];
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(Data *))success failure:(void (^)(NSError *))failure
{
    
    [self post:url params:params cacheType:YBCacheTypeReloadIgnoringLocalCacheData success:success failure:failure];
}

+ (void)uploadImageWithImage:(NSData *)image success:(void (^)(Data *obj))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *sessionManager = [self sessionManager];
    [sessionManager.requestSerializer setValue:@"image/jpg" forHTTPHeaderField:@"Content-Type"];
    NSString *httpStr = [[kAPI_URL stringByAppendingString:@"pic/fileupload"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [sessionManager POST:httpStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:image name:@"upfile" fileName:[NSString stringWithFormat:@"%.0f.jpg", [[NSDate date] timeIntervalSince1970]] mimeType:@"image/jpg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Data *data = [Data mj_objectWithKeyValues:responseObject];
        if (success) {
            success(data);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        YBLog(@"%@", error.localizedDescription);
    }];
}

+ (void)uploadImageArrayWithImages:(NSArray<NSData *> *)images success:(void (^)(Data *obj))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *sessionManager = [self sessionManager];
    [sessionManager.requestSerializer setValue:@"image/jpg" forHTTPHeaderField:@"Content-Type"];
    NSString *httpStr = [[kAPI_URL stringByAppendingString:@"pic/fileuploadArr"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [sessionManager POST:httpStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [images enumerateObjectsUsingBlock:^(NSData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [formData appendPartWithFileData:obj name:@"upfiles" fileName:[NSString stringWithFormat:@"%.0f.jpg", [[NSDate date] timeIntervalSince1970]] mimeType:@"image/jpg"];
        }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Data *data = [Data mj_objectWithKeyValues:responseObject];
        if (success) {
            success(data);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (NSDictionary *)setupParams:(NSDictionary *)params
{
    //加timestamp  appkey  version
    NSMutableDictionary *dict = [self addTimestamp_appkey_version:params];
    //排序
    NSMutableString *sourceStr = [self sortParmas:dict];
    //签名
    NSString *signStr = [self signStr:sourceStr];
    [sourceStr appendFormat:@"&signdata=%@", signStr];
    NSString *signBase64 = [[sourceStr dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
    [dict setObject:signBase64 forKey:@"signdata"];
    return dict;
}

+ (NSMutableDictionary *)addTimestamp_appkey_version:(NSDictionary *)params
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    unsigned long long timestamp = [NSDate date].timeIntervalSince1970*1000;
    [dict setObject:[@(timestamp) stringValue] forKey:@"timestamp"];
    
    [dict setObject:[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] forKey:@"version"];
    [dict setObject:@"iOS" forKey:@"appKey"];
    return dict;
}

+ (NSString *)signStr:(NSString *)sourceStr
{
    id<LLPDataSigner> signer = LLPCreateRSADataSigner(kRSAPrivate);
    NSString *signStr = [signer signString:sourceStr];
    return signStr;
}

+ (NSMutableString *)sortParmas:(NSDictionary *)params
{
    NSArray *keys = [params.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSMutableString *mStr = [NSMutableString string];
    [keys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([params[obj] length]) {
            [mStr appendFormat:@"%@=%@&", obj, params[obj]];
        }
    }];
    if (mStr.length) {
        [mStr deleteCharactersInRange:NSMakeRange(mStr.length-1, 1)];
    }
    return mStr;
}

@end
