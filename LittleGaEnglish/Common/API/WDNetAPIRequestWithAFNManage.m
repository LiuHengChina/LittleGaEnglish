//
//  WDNetAPIRequestWithAFNManage.m
//  ujh_ios_library
//
//  Created by wufd on 19/8/15.
//  Copyright (c) 2015年 jjz. All rights reserved.
//

#import "WDNetAPIRequestWithAFNManage.h"
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "WDNetAPIRequestWithAFNManage.h"

@interface WDNetAPIRequestWithAFNManage ()
@property (nonatomic,strong)NSMutableDictionary * HTTPHeaderDic;

@end
@implementation WDNetAPIRequestWithAFNManage

+ (instancetype)share {
    return [[WDNetAPIRequestWithAFNManage alloc]init];
}

/** 设置更新 HTTPHeaderField */
- (void)updateAFNUrlRequestHTTPHeader:(NSMutableDictionary *)requestHDic {
    _HTTPHeaderDic = requestHDic;
}

/** AFN普通post、get请求 */
- (void)httpRequestWithMethod:(NSString *)method
                      URL:(NSString *)urlPath
                       Params:(NSDictionary *)para
                   HTTPHeader:(NSMutableDictionary *)httpheaders
               requestSuccess:(void (^)(id json))success
               requestFailure:(void (^)(NSError *error))failure {
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *urlRequest = [requestSerializer requestWithMethod:method URLString:urlPath parameters:para error:nil];
    
    if ([method isEqualToString:@"POST"]) {
        if (para) {
            NSData *bodyData = [para objectForKey:@"bodyData"];
            if (bodyData) {
                
                urlRequest = [requestSerializer requestWithMethod:method URLString:urlPath parameters:nil error:nil];
                urlRequest.HTTPBody = bodyData;
            }
        }
    }
    
    //设置 HTTPHeaderField
    NSMutableDictionary * httpHeadDic = [NSMutableDictionary dictionary];
    if (httpheaders) {
        [httpHeadDic setValuesForKeysWithDictionary:httpheaders];
    }else{
        if (_HTTPHeaderDic) {
            [httpHeadDic setValuesForKeysWithDictionary:_HTTPHeaderDic];
        }
    }
    if ([[httpHeadDic allKeys] count]>0) {
        for (NSObject * keyObj in [httpHeadDic allKeys]) {
            NSObject * valuesObj = [httpHeadDic objectForKey:keyObj];
            if ([keyObj isKindOfClass:[NSString class]] && [valuesObj isKindOfClass:[NSString class]] ) {
                NSString * k = (NSString *)keyObj;
                NSString * v = (NSString *)valuesObj;
                [urlRequest setValue:v forHTTPHeaderField:k];
            }
        }
    }
    
    // 设置缓存策略
    [urlRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    // 设置超时时间
    [urlRequest setTimeoutInterval:30.0f];
    // 实例化url
    NSURL *url = [NSURL URLWithString:urlPath];
    AFHTTPRequestOperationManager *operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    
    // 实例化客户端请求操作
    AFHTTPRequestOperation *operation = [operationManager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 执行成功操作块代码:要判断外界代码块是否为空
        if (success) {
            // 解析json对象
            //NSLog(@"responseObject : %@",responseObject);
            
            if ([responseObject isKindOfClass:[NSData class]]) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                success(json);
                return;
            } else {
                success(responseObject);
                return;
            }
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 执行失败操作块代码
//        NSLog(@"base request NSError %@ ",error);
        if (failure) {
            // 把错误信息传递给外界
//            NSError *myError = [[NSError alloc] initWithDomain:@"有米有连接网络失败，请检查网络状态！" code:-1 userInfo:nil];
            failure(error);
        }
    }];
    // 执行操作
    [operation start];
}

/** appstore  的更新接口 */
- (void)postUpdateWithAppId:(NSString *)appid
                    Success:(void (^)(id json))success
                    failure:(void (^)(NSError *error))failure {
    NSString * urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",appid];
    self.HTTPHeaderDic = nil;
    [self httpRequestWithMethod:@"POST" URL:urlStr Params:nil HTTPHeader:nil requestSuccess:^(id json) {
        success(json);
    } requestFailure:^(NSError *error) {
//        NSLog(@"base request NSError %@ ",error);
        failure(error);
    }];
}

/** 上传图片 */
- (void)uploadFileWithMethod:(NSString *)method
                         URL:(NSString *)urlPath
                      Params:(NSDictionary *)para
                       image:(UIImage *)image
                  HTTPHeader:(NSMutableDictionary *)httpheaders
                     success:(void (^)(id json))success
                     failure:(void (^)(NSError *error))failure
                    Progress:(void (^)(long long totalBytesWritten,long long totalBytesExpectedToWrite))progress {
    if (!image) {
        // 执行失败操作块代码
        if (failure) {
            // 把错误信息传递给外界
            NSError * err = [[NSError alloc]initWithDomain:@"请选择图片上传，图片不能为空！" code:0 userInfo:nil];
            failure(err);
        }
        return;
    }
    
    AFHTTPRequestSerializer * requestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest * urlRequest = [requestSerializer multipartFormRequestWithMethod:method URLString:urlPath parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 1)
                                    name:@"photo"
                                fileName:@"file.jpg"
                                mimeType:@"image/jpg"];
        //任意的二进制数据MIMEType: application/octet-stream ;图片:image/jpg
    } error:nil];
    
    
    //设置 HTTPHeaderField
    NSMutableDictionary * httpHeadDic = [NSMutableDictionary dictionary];
    if (httpheaders) {
        [httpHeadDic setValuesForKeysWithDictionary:httpheaders];
    }else{
        if (_HTTPHeaderDic) {
            [httpHeadDic setValuesForKeysWithDictionary:_HTTPHeaderDic];
        }
    }
    if ([[httpHeadDic allKeys] count]>0) {
        for (NSObject * keyObj in [httpHeadDic allKeys]) {
            NSObject * valuesObj = [httpHeadDic objectForKey:keyObj];
            if ([keyObj isKindOfClass:[NSString class]] && [valuesObj isKindOfClass:[NSString class]] ) {
                NSString * k = (NSString *)keyObj;
                NSString * v = (NSString *)valuesObj;
                [urlRequest setValue:v forHTTPHeaderField:k];
            }
        }
    }
    
    // 设置缓存策略
    [urlRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    // 设置超时时间
    [urlRequest setTimeoutInterval:30.0f];
    // 实例化url
    NSURL *url = [NSURL URLWithString:urlPath];
    AFHTTPRequestOperationManager * operationManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    // 实例化客户端请求操作
    AFHTTPRequestOperation *operation = [operationManager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation,id responseObject) {
        if (success) {
            if ([responseObject isKindOfClass:[NSData class]]) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                success(json);
                return ;
            }else{
                success(responseObject);
                return ;
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"base request NSError %@ ",error);
        if (failure) {
            // 把错误信息传递给外界
//            NSError * myError = [[NSError alloc]initWithDomain:@"有米有连接网络失败，请检查网络状态！" code:-1 userInfo:nil];
            failure(error);
        }
    }];
    //上传文件进度
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten,
                                        long long totalBytesWritten,
                                        long long totalBytesExpectedToWrite) {
        if (progress) {
            progress( totalBytesWritten, totalBytesExpectedToWrite);
        }
    }];
    // 执行操作
    [operation start];
}

/** 上传文件 */
- (void)uploadFileWithMethod:(NSString *)method
                         URL:(NSString *)urlPath
                      Params:(NSDictionary *)para
                    FilePath:(NSString *)filePath
                  HTTPHeader:(NSMutableDictionary *)httpheaders
                     success:(void (^)(id json))success
                     failure:(void (^)(NSError *error))failure {
    
    NSData * fileData = [[NSData alloc]initWithContentsOfFile:filePath];
    AFHTTPRequestSerializer * requestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest * urlRequest = [requestSerializer multipartFormRequestWithMethod:method URLString:urlPath parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:fileData
                                    name:@"db"
                                fileName:@"YMYOfflineCache.sqlite"
                                mimeType:@"application/octet-stream"];//file/sqlite
        
        //任意的二进制数据MIMEType application/octet-stream
        
    } error:nil];
    
    //设置 HTTPHeaderField
    NSMutableDictionary * httpHeadDic = [NSMutableDictionary dictionary];
    if (httpheaders) {
        [httpHeadDic setValuesForKeysWithDictionary:httpheaders];
    }else{
        if (_HTTPHeaderDic) {
            [httpHeadDic setValuesForKeysWithDictionary:_HTTPHeaderDic];
        }
    }
    if ([[httpHeadDic allKeys] count]>0) {
        for (NSObject * keyObj in [httpHeadDic allKeys]) {
            NSObject * valuesObj = [httpHeadDic objectForKey:keyObj];
            if ([keyObj isKindOfClass:[NSString class]] && [valuesObj isKindOfClass:[NSString class]] ) {
                NSString * k = (NSString *)keyObj;
                NSString * v = (NSString *)valuesObj;
                [urlRequest setValue:v forHTTPHeaderField:k];
            }
        }
    }
    
    // 设置缓存策略
    [urlRequest setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    // 设置超时时间
    [urlRequest setTimeoutInterval:30.0f];
    // 实例化url
    NSURL *url = [NSURL URLWithString:urlPath];
    AFHTTPRequestOperationManager * operationManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    // 实例化客户端请求操作
    AFHTTPRequestOperation *operation = [operationManager HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation,id responseObject) {
        if (success) {
            if ([responseObject isKindOfClass:[NSData class]]) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                success(json);
                return ;
            }else{
                success(responseObject);
                return ;
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    //上传文件进度
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten,
                                        long long totalBytesWritten,
                                        long long totalBytesExpectedToWrite) {
    }];
    // 执行操作
    [operation start];
}



- (void)downloadFileURL:(NSString *)aUrl savePath:(NSString *)aSavePath fileName:(NSString *)aFileName  requestFinished:(void (^)(NSString * key ,NSDictionary *dic ))requestFinished
                failure:(void (^)( NSString * key ,NSError *error))failure
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //检查本地文件是否已存在
    NSString *fileName = [NSString stringWithFormat:@"%@/%@", aSavePath, aFileName];
    
    //检查附件是否存在
    if ([fileManager fileExistsAtPath:fileName]) {
        NSData *audioData = [NSData dataWithContentsOfFile:fileName];
        if (requestFinished) {
           NSDictionary * dict= [NSDictionary dictionaryWithObject:audioData forKey:@"res"];
            
            requestFinished(aFileName,dict);
        }
    }else{
        //创建附件存储目录
        if (![fileManager fileExistsAtPath:aSavePath]) {
            [fileManager createDirectoryAtPath:aSavePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        //下载附件
        NSURL *url = [[NSURL alloc] initWithString:aUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.inputStream   = [NSInputStream inputStreamWithURL:url];
        operation.outputStream  = [NSOutputStream outputStreamToFileAtPath:fileName append:NO];
        
        //下载进度控制
        /*
         [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
         NSLog(@"is download：%f", (float)totalBytesRead/totalBytesExpectedToRead);
         }];
         */
        
        //已完成下载
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSData *audioData = [NSData dataWithContentsOfFile:fileName];
            
            if (requestFinished) {
                requestFinished(aFileName,[NSDictionary dictionaryWithObject:audioData forKey:@"res"]);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"base request NSError %@ ",error);
            if (failure) {
                failure(aFileName,error);
            }
        }];
        
        [operation start];
    }
}

@end
