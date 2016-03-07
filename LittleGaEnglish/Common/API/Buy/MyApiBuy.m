//
//  MyApiBuy.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/5.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyApiBuy.h"

@implementation MyApiBuy


+ (instancetype)share
{
    return [[MyApiBuy alloc]init];
}


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
                       Failure:(void(^)(MyApiBuy * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{@"classId":classId};
    
    NSString *urlPath = k_url_showProduct;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            BuyModel *model = [[BuyModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self,model);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"服务器数据错误";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
    } failure:^(NSError *error) {
        failure(self,error);
    }];

}

@end
