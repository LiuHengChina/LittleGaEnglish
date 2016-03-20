//
//  MyApiEvaluation.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/14.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyApiEvaluation.h"

@implementation MyApiEvaluation

+ (instancetype)share
{
    return [[MyApiEvaluation alloc]init];
}

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
                    Failure:(void(^)(MyApiEvaluation * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{@"type":type,
                          @"page":page};
    
    NSString *urlPath = k_url_evaluationList;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            EvaluationModel *model = [[EvaluationModel new]initWithDictionary:json error:nil];
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


/**
 *  获取考题
 *
 *  @param id      id description
 *  @param success success description
 *  @param failure failure description
 */
- (void)getKaotiWithID:(NSString *)idStr
            Success:(void(^)(MyApiEvaluation * request , NSMutableArray * arr))success
            Failure:(void(^)(MyApiEvaluation * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{@"id":idStr};
    
    NSString *urlPath = k_url_getKaoTi;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            KaoTiListModel *model = [[KaoTiListModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self,model.list);
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
