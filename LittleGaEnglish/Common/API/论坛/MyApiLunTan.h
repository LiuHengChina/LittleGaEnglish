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

//- (void)sendYuYin


@end
