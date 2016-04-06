//
//  MyApiLunTan.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"
#import "LunTanMainModel.h"
#import "LunTanListModel.h"
#import "WeiBaListModel.h"
#import "HuaTiListModel.h"
#import "ImageModel.h"
#import "VoiceModel.h"
#import "ThreadDetailModel.h"
#import "TopicDetailModel.h"

@interface MyApiLunTan : BaseNetRequest

+ (instancetype)share;

// 论坛首页
- (void)getBBSIndexDataSuccess:(void(^)(MyApiLunTan * request , LunTanMainModel * model))success
                       Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;


// 帖子列表接口
- (void)getThreadListDataID:(NSString *)weibo_id
                     digest:(BOOL)digest
                      order:(NSString *)order
                       page:(NSString *)page
                    Success:(void(^)(MyApiLunTan * request , LunTanListModel * model))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;

// 签到接口
- (void)singSuccess:(void(^)(MyApiLunTan * request, NSString *signDate))success
            Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;

// 话题列表
- (void)getHuaTiListSuccess:(void(^)(MyApiLunTan * request, NSMutableArray *array))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;

// 微吧列表
- (void)getWeiBaListSuccess:(void(^)(MyApiLunTan * request, NSMutableArray *array))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;


/**
 *  上传图片
 *
 *  @param picture
 *  @param success
 *  @param failur
 */
- (void)sendRequestOpenNewShopOnlineWithPicture:(UIImage *)picture
                                        Success:(void (^)(MyApiLunTan *request, ImageModel *model))success
                                        Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;

// 上传文件
- (void)sendYuYinSuccess:(void (^)(MyApiLunTan *request, VoiceModel *model))success
                 Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;



// 发布帖子
- (void)upThreadWithTitle:(NSString *)title
                  content:(NSString *)content
                 weiba_id:(NSString *)weiba_id
                   urlStr:(NSString *)imageUrl
                 vocie_id:(NSString *)voice_id
                flash_url:(NSString *)flash_url
                  Success:(void (^)(MyApiLunTan *request))success
                  Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;

// 发布话题
- (void)upTopicWithTitle:(NSString *)title
                 content:(NSString *)content
                  urlStr:(NSString *)imageUrl
                vocie_id:(NSString *)voice_id
               flash_url:(NSString *)flash_url
                 Success:(void (^)(MyApiLunTan *request))success
                 Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;


// 帖子内容页
- (void)getThreadDetailWithThread_id:(NSString *)thread_id
                                page:(NSString *)page
                             Success:(void (^)(MyApiLunTan *request, ThreadDetailModel *model))success
                             Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;


// 话题内容页
- (void)getTopicDetailWithTopic_id:(NSString *)topic_id
                               page:(NSString *)page
                            Success:(void (^)(MyApiLunTan *request, TopicDetailModel *model))success
                            Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;


// 帖子点赞
- (void)dianzanThreadWithPost_id:(NSString *)post_id
                         Success:(void (^)(MyApiLunTan *request))success
                         Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;

// 帖子收藏
- (void)favThreadWithPost_id:(NSString *)post_id
                     Success:(void (^)(MyApiLunTan *request))success
                     Failure:(void (^)(MyApiLunTan *request, NSError *error))failur;




@end
