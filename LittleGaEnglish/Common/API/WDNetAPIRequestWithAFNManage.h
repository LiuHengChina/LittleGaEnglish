//
//  WDNetAPIRequestWithAFNManage.h
//  ujh_ios_library
//
//  Created by wufd on 19/8/15.
//  Copyright (c) 2015年 jjz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WDNetAPIRequestWithAFNManage : NSObject

+ (instancetype)share;
/** 设置更新 HTTPHeaderField */
- (void)updateAFNUrlRequestHTTPHeader:(NSMutableDictionary *)requestHDic;

/** AFN普通post、get请求 */
- (void)httpRequestWithMethod:(NSString *)method
                      URL:(NSString *)urlPath
                       Params:(NSDictionary *)para
                   HTTPHeader:(NSMutableDictionary *)requestHDic
               requestSuccess:(void (^)(id json))success
               requestFailure:(void (^)(NSError *error))failure;

/** appstore  的更新接口 */
- (void)postUpdateWithAppId:(NSString *)appid
                    Success:(void (^)(id json))success
                    failure:(void (^)(NSError *error))failure;

/** 上传图片 */
- (void)uploadFileWithMethod:(NSString *)method
                         URL:(NSString *)urlPath
                      Params:(NSDictionary *)para
                       image:(UIImage *)image
                  HTTPHeader:(NSMutableDictionary *)requestHDic
                     success:(void (^)(id json))success
                     failure:(void (^)(NSError *error))failure
                    Progress:(void (^)(long long totalBytesWritten,long long totalBytesExpectedToWrite))progress;

/** 上传文件 */
- (void)uploadFileWithMethod:(NSString *)method
                         URL:(NSString *)urlPath
                      Params:(NSDictionary *)para
                       FilePath:(NSString *)filePath
                  HTTPHeader:(NSMutableDictionary *)requestHDic
                     success:(void (^)(id json))success
                     failure:(void (^)(NSError *error))failure;

/** 下载文件 */
- (void)downloadFileURL:(NSString *)aUrl
               savePath:(NSString *)aSavePath
               fileName:(NSString *)aFileName
        requestFinished:(void (^)(NSString * key ,NSDictionary *dic ))requestFinished
                failure:(void (^)(NSString * key ,NSError *error))failure;



@end
