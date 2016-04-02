//
//  MyApiLunTan.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyApiLunTan.h"

@implementation MyApiLunTan

+ (instancetype)share
{
    return [[MyApiLunTan alloc]init];
}

// 论坛首页
- (void)getBBSIndexDataSuccess:(void(^)(MyApiLunTan * request , LunTanMainModel * model))success
                       Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{

    
    NSDictionary *dic = @{};
    [self postWithUrl:k_url_bbsIndex params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            LunTanMainModel *model = [[LunTanMainModel new]initWithDictionary:json error:nil];
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


// 帖子列表接口
- (void)getThreadListDataID:(NSString *)weibo_id
                     digest:(BOOL)digest
                      order:(NSString *)order
                       page:(NSString *)page
                    Success:(void(^)(MyApiLunTan * request , LunTanListModel * model))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{
    NSDictionary *dic;
    if (weibo_id != nil) {
        dic = @{@"weiba_id":weibo_id,
                @"digest":[NSString stringWithFormat:@"%d",digest],
                @"order":order,
                @"Page":page};
    } else {
        dic = @{@"digest":[NSString stringWithFormat:@"%d",digest],
                @"order":order,
                @"Page":page};
    }
    
    [self postWithUrl:k_url_threadList params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            LunTanListModel *model = [[LunTanListModel new]initWithDictionary:json error:nil];
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
