//
//  MyApiMine.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/12.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyApiMine.h"
#import "CoureseModel.h"

@implementation MyApiMine

+ (instancetype)share{
    return [[MyApiMine alloc]init];
}


- (void) getMyInfoSuccess:(void(^)(MyApiMine * request , MineModel * model))success
                  Failure:(void(^)(MyApiMine * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{};
    
    NSString *urlPath = k_url_userCenter;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            errmsg = json[@"info"];
            if ( [json[@"status"]   isEqual: @1]) {
                MineModel *mineModel = [[MineModel new]initWithDictionary:json[@"data"] error:nil];
                success(self,mineModel);
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


- (void)getCollectionClassByUrl:(NSString *)url
                        Success:(void(^)(MyApiMine * request , NSMutableArray * arr))success
                        Failure:(void(^)(MyApiMine * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{};
    
    NSString *urlPath = url;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            BaseModel *model = [[BaseModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                NSMutableArray *arr =  [CoureseModel arrayOfModelsFromDictionaries:model.data];
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

@end
