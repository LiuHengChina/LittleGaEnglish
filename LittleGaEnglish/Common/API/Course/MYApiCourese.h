//
//  MYApiCourese.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"

#import "CoureseModel.h"
#import "CourseDetailModel.h"

@interface MYApiCourese : BaseNetRequest

+ (instancetype)share;

/**
 *  获取课程列表
 *
 *  @param url      url description
 *  @param key      key description
 *  @param page     page description
 *  @param pageSize pageSize description
 *  @param success  success description
 *  @param failure  failure description
 */
- (void)sendRequestWithUrl:(NSString *)url
                 searchKey:(NSString *)key
                      page:(NSInteger)page
                  pageSize:(NSInteger)pageSize
                     Success:(void(^)(MYApiCourese * request , NSMutableArray * arr))success
                     Failure:(void(^)(MYApiCourese * request ,NSError *requestError))failure;

/**
 *  获取课程详情
 *
 *  @param classId classId description
 *  @param success success description
 *  @param failure failure description
 */
- (void)sendRequestWithClassID:(NSString *)classId
                       Success:(void (^)(MYApiCourese *request, CourseDetailModel *model))success
                       Failure:(void (^)(MYApiCourese *request, NSError *requestError))failure;

/**
 *  点赞课程
 *
 *  @param classId classId description
 *  @param success success description
 *  @param failure failure description
 */
- (void)sendRequestLikeClassWithClassID:(NSString *)classId
                                Success:(void (^)(MYApiCourese *request, BaseModel *model))success
                                Failure:(void (^)(MYApiCourese *request, NSError *requestError))failure;


/**
 *  收藏课程
 *
 *  @param classId classId description
 *  @param success success description
 *  @param failure failure description
 */
- (void)sendRequestFavouriteClassWithClassID:(NSString *)classId
                                     Success:(void (^)(MYApiCourese *request, BaseModel *model))success
                                     Failure:(void (^)(MYApiCourese *request, NSError *requestError))failure;



/**
 *  发表评论
 *
 *  @param classId classId description
 *  @param star    star description
 *  @param content content description
 *  @param success success description
 *  @param failure failure description
 */
- (void)sendCommentWithClassID:(NSString *)classId
                          star:(NSString *)star
                       content:(NSString *)content
                       Success:(void (^)(MYApiCourese *request, BaseModel *model))success
                       Failure:(void (^)(MYApiCourese *request, NSError *requestError))failure;


@end
