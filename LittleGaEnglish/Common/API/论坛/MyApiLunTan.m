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


@end
