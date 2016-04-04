//
//  APIBaseNetRequest.m
//  usedCar
//
//  Created by Lirui on 11/5/14.
//  Copyright (c) 2014 ujuhui. All rights reserved.
//

#import "BaseNetRequest.h"
#import "AFNetworking.h"
#import "MyConstantKey.h"
#import "NSString+RegularString.h"
//#import "JSONKit.h"

@interface BaseNetRequest ()

#pragma mark - 签名采用HMAC-MD5，对请求的URL PATH，当前时间，当前用户ID（如果有）进行签名
//签名结果
@property (nonatomic,strong)NSString * msg_to_digest;

#pragma mark - HTTP请求头 Date X-UID Authorization
//请求时间 Date: yyyy-mm-dd HH:MM:SS // 请求时间
@property (nonatomic,strong)NSString * dateString;
//Authorization: key ydk digested_message //即：调用方的key + 空格 + ydk + 签名结果
@property (nonatomic,strong)NSString * authorizationString;

#pragma mark - 加密 签名 的关键词 key、secret
@property (nonatomic,strong)NSString * key;
@property (nonatomic,strong)NSString * secret ;

#pragma mark - 签名方式 ydk
//签名方式（目前只有一种签名方式，我们命名为ydk）signString =  ydk
@property (nonatomic,strong)NSString * signString;
@property (nonatomic,strong)NSString * x_appString;

//X-UID: 123:UJCMqtT0o9eHJn99J7QbxPvTz3c //当前用户账号ID。对于不需要登录即可访问的API，此头可选。
@property (nonatomic,strong)NSString * uidString;

//URL的path信息
@property (nonatomic,strong)NSString * urlPathStrng;
@property(nonatomic, strong) NSMutableDictionary *HTTPHeaderFieldPara;

@end

@implementation BaseNetRequest


- (void)returnMsg_to_digest {
    self.uidString = @"";
////    User * user = [UserDao share].user;
////    if (user && user.uId && ![user.uId isEqualToString:@""]) {
////        self.uidString = user.uId;
////    }
//
//    self.signString = kHttp_Sign;
//    self.key        = kHttp_Key;
//    self.secret     = kHttp_Secret;
//    self.dateString = [NSString DateFormatterNowDate:nil DateFormat:nil];
//    NSString * tempString = [NSString stringWithFormat:@"%@%@",self.urlPathStrng,self.dateString];
//    self.msg_to_digest = [NSString hmacMD5:self.secret content:tempString];
//    self.authorizationString = [NSString stringWithFormat:@"%@ %@ %@",
//                                self.key,
//                                self.signString,
//                                self.msg_to_digest
//                                ];
//    
//    NSDictionary * infoDic = [[NSBundle mainBundle] infoDictionary];
//    NSString * appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
////    self.x_appString = [NSString stringWithFormat:@"%@/%@-%@",[OpenUDID value],kAppNamesVersion,appVersion];
//    
//    self.HTTPHeaderFieldPara = [NSMutableDictionary dictionary];
//    [self.HTTPHeaderFieldPara setObject:[NSString stringWithFormat:@"%@", self.dateString] forKey:@"Date"];
//    [self.HTTPHeaderFieldPara setObject:[NSString stringWithFormat:@"%@", self.uidString] forKey:@"X-UID"];
//    [self.HTTPHeaderFieldPara setObject:[NSString stringWithFormat:@"%@", self.authorizationString] forKey:@"Authorization"];
//    [self.HTTPHeaderFieldPara setObject:[NSString stringWithFormat:@"%@", self.x_appString] forKey:@"X-Client"];
}



+ (NSDictionary *)HeaderDicWithUrl:(NSString *)url
{
    BaseNetRequest *request = [BaseNetRequest new];
    request.urlPathStrng = url;
    [request returnMsg_to_digest];
    return request.HTTPHeaderFieldPara;
}


#pragma mark - 上层封装，开放接口
//block 方式请求
- (void)postWithUrl:(NSString *)urlPath  WithUrlAppandStr:(NSString *)appandStr params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    self.urlPathStrng = urlPath;
    [self returnMsg_to_digest];
    
    NSMutableString * urlStr = [NSMutableString stringWithString:urlPath];
    if (appandStr && ![appandStr isEqualToString:@""]) {
        [urlStr appendString:appandStr];
    }
    
    NSString * url = [NSString stringWithFormat:@"%@%@",kURL,urlStr];
    [self httpRequestWithMethod:@"POST" url:url params:params success:success failure:failure];
}

- (void)getWithUrl:(NSString *)urlPath  WithUrlAppandStr:(NSString *)appandStr params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    self.urlPathStrng = urlPath;
    [self returnMsg_to_digest];
    
    NSMutableString * urlStr = [NSMutableString stringWithString:urlPath];
    if (appandStr && ![appandStr isEqualToString:@""]) {
        [urlStr appendString:appandStr];
    }
    NSString * url = [NSString stringWithFormat:@"%@%@",kURL,urlStr];
    NSLog(@"url ,%@",url);
    [self httpRequestWithMethod:@"GET" url:url params:params success:success failure:failure];
}

//使用block方式的post请求
- (void)postWithUrl:(NSString *)urlPath params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setValue:[UserDao share].user.uid forKey:@"uid"];
    [dic setValue:[UserDao share].user.token forKey:@"token"];
    [self postWithUrl:urlPath WithUrlAppandStr:nil params:dic success:success failure:failure];
}

//使用block方式的get请求
- (void)getWithUrl:(NSString *)urlPath params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setValue:[UserDao share].user.uid forKey:@"uid"];
    [dic setValue:[UserDao share].user.token forKey:@"token"];
    [self getWithUrl:urlPath WithUrlAppandStr:nil params:dic success:success failure:failure];
}

#pragma mark - 调用AFN BASE MANAGER
//update app
- (void)postUpdateWithAppId:(NSString *)appid Success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    
    [[WDNetAPIRequestWithAFNManage share]postUpdateWithAppId:appid Success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void) httpRequestWithMethod:(NSString *)method url:(NSString *)urlPath params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    
    [[WDNetAPIRequestWithAFNManage share]httpRequestWithMethod:method URL:urlPath Params:params HTTPHeader:self.HTTPHeaderFieldPara requestSuccess:^(id json) {
        if (success) {
            NSLog(@"urlPath : %@",urlPath);
            if (![self defaultRequestError:json]) {
                success(json);
            }
        }
    } requestFailure:^(NSError *error) {
        NSLog(@"%@",error);
        if (failure) {
            NSError * myError = [[NSError alloc]initWithDomain:@"有米有连接网络失败，请检查网络状态！" code:-1 userInfo:nil];
            failure(myError);
        }
    }];
}

- (BOOL)defaultRequestError:(id)json {
//    if (json && [json isKindOfClass:[NSDictionary class]]) {
//        NSDictionary * dic = (NSDictionary *)json;
//        if (dic && [dic objectForKey:@"errnum"]) {
//            NSNumber * errnum = [dic objectForKey:@"errnum"];
//            NSString * errmsg = [dic objectForKey:@"errmsg"];
//            if (errnum) {
//                if ([errnum longValue]==10102) {
//                    [[WDRequestError getInstance]showResetLogin:errmsg];
//                    return YES;
//                }else if ([errnum longValue]==10703) {
//                    [[WDRequestError getInstance] showAccessoriesShop:errmsg];
//                    return YES;
//                }
//            }
//        }
//    }
    return NO;
}

- (void)uploadFileWithUrl:(NSString *)urlPath params:(NSDictionary *)params image:(UIImage *)image success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure Progress:(HttpUploadProgressBlock)progress {
    
    self.urlPathStrng = urlPath;
    [self returnMsg_to_digest];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kURL,urlPath];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setValue:[UserDao share].user.uid forKey:@"uid"];
    [dic setValue:[UserDao share].user.token forKey:@"token"];
    [[WDNetAPIRequestWithAFNManage share]uploadFileWithMethod:@"POST" URL:urlStr Params:dic image:image HTTPHeader:self.HTTPHeaderFieldPara success:^(id json) {
        
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        NSLog(@"base request NSError %@ ",error);
        if (failure) {
            failure(error);
        }
    } Progress:^(long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        if (progress) {
            progress( totalBytesWritten, totalBytesExpectedToWrite);
        }
    }];
}

@end

#pragma mark - download zip file
@implementation BaseNetRequest (DownloadZipFile)

//上传文件
- (void)uploadFileWithUrl:(NSString *)urlPath
                   params:(NSDictionary *)params
                 FilePath:(NSString *)file
                  success:(HttpSuccessBlock)success
                  failure:(HttpFailureBlock)failure {
    
    self.urlPathStrng = urlPath;
    [self returnMsg_to_digest];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kURL,urlPath];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    [dic setValue:[UserDao share].user.uid forKey:@"uid"];
    [dic setValue:[UserDao share].user.token forKey:@"token"];
    
    [[WDNetAPIRequestWithAFNManage share]uploadFileWithMethod:@"POST" URL:urlStr Params:dic FilePath:file HTTPHeader:self.HTTPHeaderFieldPara success:^(id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            NSError * myError = [[NSError alloc]initWithDomain:@"连接网络失败，请检查网络状态！" code:-1 userInfo:nil];
            failure(myError);
        }
    }];
}

//下载文件
- (void)downloadFileWithUrl:(NSString *)urlPath
                     params:(NSDictionary *)params
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure
                   Progress:(void (^)(float))progressBlock {
    
    self.urlPathStrng = urlPath;
    [self returnMsg_to_digest];
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kURL,urlPath];
    
    NSString * method = @"POST";
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *urlRequest = [requestSerializer requestWithMethod:method URLString:urlStr parameters:params error:nil];
    
    if ([method isEqualToString:@"POST"]) {
        if (params) {
            NSData *bodyData = [params objectForKey:@"bodyData"];
            if (bodyData) {
                urlRequest = [requestSerializer requestWithMethod:method URLString:urlStr parameters:nil error:nil];
                urlRequest.HTTPBody = bodyData;
            }
        }
    }
    //设置 HTTPHeaderField
    if ([[self.HTTPHeaderFieldPara allKeys] count]>0) {
        for (NSObject * keyObj in [self.HTTPHeaderFieldPara allKeys]) {
            NSObject * valuesObj = [self.HTTPHeaderFieldPara objectForKey:keyObj];
            if ([keyObj isKindOfClass:[NSString class]] && [valuesObj isKindOfClass:[NSString class]] ) {
                NSString * k = (NSString *)keyObj;
                NSString * v = (NSString *)valuesObj;
                [urlRequest setValue:v forHTTPHeaderField:k];
            }
        }
    }
    
    // 实例化url
    NSURL *url = [NSURL URLWithString:urlStr];
    //不使用缓存，避免断点续传出现问题
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:urlRequest];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString * zipPath = [documentsPath stringByAppendingPathComponent:@"ZIP"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    //检查文件是否已经下载了一部分
    unsigned long long downloadedBytes = 0;
    if (![fileManager fileExistsAtPath:zipPath ]) {
        [fileManager createDirectoryAtPath:zipPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //检查本地文件是否已存在
    NSString * zipFilePath = [zipPath stringByAppendingString:@"YMYDB.zip"];
    signed long long fileSize = 0;
    if([fileManager fileExistsAtPath:zipFilePath]){
        NSError *error = nil;
        NSDictionary *fileDict = [fileManager attributesOfItemAtPath:zipFilePath error:&error];
        if (!error && fileDict){
            fileSize = [fileDict fileSize];
        }
    }
    //获取已下载的文件长度
    downloadedBytes = fileSize;
    if (downloadedBytes>0) {
        NSString *requestRange = [NSString stringWithFormat:@"bytes=%llu-", downloadedBytes];
        [urlRequest setValue:requestRange forHTTPHeaderField:@"Range"];
    }
    
    //下载请求
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    //下载路径
//    operation.inputStream   = [NSInputStream inputStreamWithURL:url];
    operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:zipFilePath append:YES];
    
    //下载进度控制 下载进度回调
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        float progress = ((float)totalBytesRead + downloadedBytes) / (totalBytesExpectedToRead + downloadedBytes);
        NSLog(@"is download：%f", progress);
        if (progressBlock) {
            progressBlock(progress);
        }
    }];
    
    //已完成下载 成功和失败回调
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

        // Unzip
//        [SSZipArchive unzipFileAtPath:zipFilePath toDestination:zipPath];
//        [[NSFileManager defaultManager] removeItemAtPath:zipFilePath error:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    [operation start];
}

//断点
- (void)BreakpointDownloadZipFileWithUrl:(NSString *)urlPath
                                  params:(NSDictionary *)params
                                 success:(HttpSuccessBlock)success
                                 failure:(HttpFailureBlock)failure
                                Progress:(void (^)(float))progressBlock {
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString * zipPath = [documentsPath stringByAppendingPathComponent:@"ZIP"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    //检查文件是否已经下载了一部分
    unsigned long long downloadedBytes = 0;
    if (![fileManager fileExistsAtPath:zipPath ]) {
        [fileManager createDirectoryAtPath:zipPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //检查本地文件是否已存在
    NSString * zipFilePath = [zipPath stringByAppendingString:@"YMYDB.zip"];
    
    signed long long fileSize = 0;
    if([fileManager fileExistsAtPath:zipFilePath]){
        NSError *error = nil;
        NSDictionary *fileDict = [fileManager attributesOfItemAtPath:zipFilePath error:&error];
        if (!error && fileDict){
            fileSize = [fileDict fileSize];
        }
    }
    //获取已下载的文件长度
    downloadedBytes = fileSize;
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kURL,urlPath];
    // 实例化url
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    //不使用缓存，避免断点续传出现问题
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:urlRequest];
    if (downloadedBytes>0) {
        NSString *requestRange = [NSString stringWithFormat:@"bytes=%llu-", downloadedBytes];
        [urlRequest setValue:requestRange forHTTPHeaderField:@"Range"];
    }
    
    //下载请求
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    //下载路径
    //    operation.inputStream   = [NSInputStream inputStreamWithURL:url];
    operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:zipFilePath append:YES];
    
    //已完成下载 成功和失败回调
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // Unzip
//        [SSZipArchive unzipFileAtPath:zipFilePath toDestination:zipPath];
//        [[NSFileManager defaultManager] removeItemAtPath:zipFilePath error:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    //下载进度控制 下载进度回调
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        float progress = ((float)totalBytesRead + downloadedBytes) / (totalBytesExpectedToRead + downloadedBytes);
        NSLog(@"is download：%f", progress);
        if (progressBlock) {
            progressBlock(progress);
        }
    }];
    [operation start];
}

//不断点
- (void)NOBreakpointDownloadZipFileWithUrl:(NSString *)urlPath
                                    params:(NSDictionary *)params
                                   success:(HttpSuccessBlock)success
                                   failure:(HttpFailureBlock)failure
                                  Progress:(void (^)(float))progressBlock {
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString * zipPath = [documentsPath stringByAppendingPathComponent:@"ZIP"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    //检查文件是否已经下载了一部分
    if (![fileManager fileExistsAtPath:zipPath ]) {
        [fileManager createDirectoryAtPath:zipPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //检查本地文件是否已存在
    NSString * zipFilePath = [zipPath stringByAppendingString:@"YMYDB.zip"];
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",kURL,urlPath];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    //    //不使用缓存，避免断点续传出现问题
    //    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:urlRequest];
    
    //下载请求
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    //下载路径
    // 实例化url
    //    NSURL *url = [NSURL URLWithString:urlStr];
    //    operation.inputStream   = [NSInputStream inputStreamWithURL:url];
    operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:zipFilePath append:YES];
    
    //已完成下载 成功和失败回调
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // Unzip
//        [SSZipArchive unzipFileAtPath:zipFilePath toDestination:zipPath];
        [[NSFileManager defaultManager] removeItemAtPath:zipFilePath error:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    //下载进度控制 下载进度回调
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {

        float progress = ((float)totalBytesRead ) / (totalBytesExpectedToRead );
        NSLog(@"is download：%f", progress);
        if (progressBlock) {
            progressBlock(progress);
        }
    }];
    [operation start];
}

@end
