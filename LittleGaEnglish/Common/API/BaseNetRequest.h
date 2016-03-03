//
//  APIBaseNetRequest.h
//  usedCar
//
//  Created by Lirui on 11/5/14.
//  Copyright (c) 2014 ujuhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "APIUrl.h"
#import "WDNetAPIRequestWithAFNManage.h"

@class BaseNetRequest;

/*定义成功块*/
typedef void (^HttpSuccessBlock)(id json);
/*定义失败块*/
typedef void (^HttpFailureBlock)(NSError *error);
/*定义上传进度*/
typedef void (^HttpUploadProgressBlock)(long long totalBytesWritten, long long totalBytesExpectedToWrite);

typedef void (^RequestSuccessCallback)(BaseNetRequest *request, id result, NSString *notice);
typedef void (^RequestFailureCallback)(BaseNetRequest *request, NSError *error);

@interface BaseNetRequest : NSObject


//@property (nonatomic, strong, readonly) NSDictionary *headerDic;

+ (NSDictionary *)HeaderDicWithUrl:(NSString *)url;

//使用block方式的post请求
- (void)postWithUrl:(NSString *)urlPath
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;

//使用block方式的get请求
- (void)getWithUrl:(NSString *)urlPath
            params:(NSDictionary *)params
           success:(HttpSuccessBlock)success
           failure:(HttpFailureBlock)failure;

//使用block方式的post请求
- (void)postWithUrl:(NSString *)urlPath
   WithUrlAppandStr:(NSString *)appandStr
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;

//使用block方式的get请求
- (void)getWithUrl:(NSString *)urlPath
  WithUrlAppandStr:(NSString *)appandStr
            params:(NSDictionary *)params
           success:(HttpSuccessBlock)success
           failure:(HttpFailureBlock)failure;

//上传图片
- (void)uploadFileWithUrl:(NSString *)urlPath
                   params:(NSDictionary *)params
                    image:(UIImage *)image
                  success:(HttpSuccessBlock)success
                  failure:(HttpFailureBlock)failure
                 Progress:(HttpUploadProgressBlock)progress;

// appstore  的更新接口
- (void)postUpdateWithAppId:(NSString *)appid
                    Success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure;

@end

#pragma mark - download zip file
@interface BaseNetRequest (DownloadZipFile)
//上传文件
- (void)uploadFileWithUrl:(NSString *)urlPath
                   params:(NSDictionary *)params
                    FilePath:(NSString *)file
                  success:(HttpSuccessBlock)success
                  failure:(HttpFailureBlock)failure;

//下载文件 
- (void)downloadFileWithUrl:(NSString *)urlPath
                     params:(NSDictionary *)params
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure
                   Progress:(void (^)(float))progressBlock;
//断点
- (void)BreakpointDownloadZipFileWithUrl:(NSString *)urlPath
                                  params:(NSDictionary *)params
                                 success:(HttpSuccessBlock)success
                                 failure:(HttpFailureBlock)failure
                                Progress:(void (^)(float))progressBlock;
//不断点
- (void)NOBreakpointDownloadZipFileWithUrl:(NSString *)urlPath
                                    params:(NSDictionary *)params
                                   success:(HttpSuccessBlock)success
                                   failure:(HttpFailureBlock)failure
                                  Progress:(void (^)(float))progressBlock;
@end
