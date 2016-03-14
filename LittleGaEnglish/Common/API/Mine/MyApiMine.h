//
//  MyApiMine.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/12.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"
#import "MineModel.h"

@interface MyApiMine : BaseNetRequest

+ (instancetype)share;

/**
 *  个人中心
 *
 *  @param success success description
 *  @param failure failure description
 */
- (void) getMyInfoSuccess:(void(^)(MyApiMine * request , MineModel * model))success
                       Failure:(void(^)(MyApiMine * request ,NSError *requestError))failure;

/**
 *  我的收藏
 *
 *  @param url     url description
 *  @param success success description
 *  @param failure failure description
 */
- (void)getCollectionClassByUrl:(NSString *)url
                        Success:(void(^)(MyApiMine * request , NSMutableArray * arr))success
                        Failure:(void(^)(MyApiMine * request ,NSError *requestError))failure;




@end
