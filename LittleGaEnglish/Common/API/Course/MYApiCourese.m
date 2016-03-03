//
//  MYApiCourese.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MYApiCourese.h"

@implementation MYApiCourese


+(instancetype)share
{
    return [[MYApiCourese alloc]init];
}

- (void)sendRequestWithUrl:(NSString *)url
                 searchKey:(NSString *)key
                      page:(NSInteger)page
                  pageSize:(NSInteger)pageSize
                   Success:(void(^)(MYApiCourese * request , NSMutableArray * arr))success
                   Failure:(void(^)(MYApiCourese * request ,NSError *requestError))failure{
    
    
    NSDictionary *dic = @{@"searchKey":key,
                          @"page":[NSString stringWithFormat:@"%ld",(long)page],
                          @"pageSize":[NSString stringWithFormat:@"%ld",(long)pageSize]};
    
    NSString *urlPath = url;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            BaseModel *model = [[BaseModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                NSMutableArray *arr = [CoureseModel arrayOfModelsFromDictionaries:model.data];
                success(self,arr);
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

- (void)sendRequestWithClassID:(NSString *)classId Success:(void (^)(MYApiCourese *, CourseDetailModel *))success Failure:(void (^)(MYApiCourese *, NSError *))failure
{
    
    
    
    NSDictionary *dic = @{@"classId":classId};
    
    NSString *urlPath = k_url_ClassDetail;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            
            CourseDetailModel *model = [[CourseDetailModel new] initWithDictionary:json error:nil];
            model.courseClass = [[CourseClassModel new] initWithDictionary:json[@"class"] error:nil];
            model.mycomment = [[CourseCommentModel new]initWithDictionary:json[@"comment"] error:nil];

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
 *  点赞
 *
 *  @param classId classId description
 *  @param success success description
 *  @param failure failure description
 */
- (void)sendRequestLikeClassWithClassID:(NSString *)classId Success:(void (^)(MYApiCourese *, BaseModel *))success Failure:(void (^)(MYApiCourese *, NSError *))failure
{
    NSDictionary *dic = @{@"classId":classId};
    
    NSString *urlPath = k_url_likeClass;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            
            BaseModel *model = [[BaseModel new] initWithDictionary:json error:nil];
        
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


- (void)sendRequestFavouriteClassWithClassID:(NSString *)classId
                                     Success:(void (^)(MYApiCourese *request, BaseModel *model))success
                                     Failure:(void (^)(MYApiCourese *request, NSError *requestError))failure
{
    NSDictionary *dic = @{@"classId":classId};
    
    NSString *urlPath = k_url_favoriteClass;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            
            BaseModel *model = [[BaseModel new] initWithDictionary:json error:nil];
            
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
                       Failure:(void (^)(MYApiCourese *request, NSError *requestError))failure
{
 
    NSDictionary *dic = @{@"classId":classId,
                          @"star":star,
                          @"content":content};
    
    NSString *urlPath = k_url_favoriteClass;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            
            BaseModel *model = [[BaseModel new] initWithDictionary:json error:nil];
            
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
