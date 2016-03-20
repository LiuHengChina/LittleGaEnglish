//
//  MyApiEvaluation.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/14.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"

#import "EvaluationModel.h"
#import "KaoTiListModel.h"

@interface MyApiEvaluation : BaseNetRequest

+ (instancetype)share;

/**
 *  评测列表接口
 *
 *  @param type    type description
 *  @param page    page description
 *  @param success success description
 *  @param failure failure description
 */
- (void)sendRequestWithType:(NSString *)type
                        page:(NSString *)page
                       Success:(void(^)(MyApiEvaluation * request , EvaluationModel * model))success
                       Failure:(void(^)(MyApiEvaluation * request ,NSError *requestError))failure;
/**
 *  获取考题
 *
 *  @param id      id description
 *  @param success success description
 *  @param failure failure description
 */
- (void)getKaotiWithID:(NSString *)idStr
            Success:(void(^)(MyApiEvaluation * request , NSMutableArray * arr))success
            Failure:(void(^)(MyApiEvaluation * request ,NSError *requestError))failure;



@end
