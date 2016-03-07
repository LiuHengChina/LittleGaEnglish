//
//  MyApiBuy.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/5.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetRequest.h"
#import "BuyModel.h"

@interface MyApiBuy : BaseNetRequest


+ (instancetype)share;

/**
 *  课程购买页
 *
 *  @param classId   classId description
 *  @param mealId    mealId description
 *  @param productID productID description
 *  @param success   success description
 *  @param failure   failure description
 */
- (void)sendRequestWithclassID:(NSString *)classId
                        mealid:(NSString *)mealId
                     productId:(NSString *)productID
                   Success:(void(^)(MyApiBuy * request , BuyModel * model))success
                   Failure:(void(^)(MyApiBuy * request ,NSError *requestError))failure;


@end
