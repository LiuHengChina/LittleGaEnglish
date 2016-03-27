//
//  MyApiLogin.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/23.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyApiLogin.h"

@implementation MyApiLogin

+(instancetype)share
{
    return [[MyApiLogin alloc]init];
}


- (void)sendRequestWithPhone:(NSString *)phone pwd:(NSString *)pwd Success:(void (^)(MyApiLogin *, LoginModel *))success Failure:(void (^)(MyApiLogin *, NSError *))failure
{
    if (phone.isEmpty || pwd.isEmpty) {
        return;
    }
    
    NSDictionary *dic = @{@"phone":phone,
                          @"password":pwd};
    
    NSString *urlPath = k_url_login;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            LoginModel *model = [[LoginModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self,model);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"登录失败";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}


- (void)registerWithPhone:(NSString *)phone pwd:(NSString *)pwd code:(NSString *)code Success:(void (^)(MyApiLogin *, LoginModel *))success Failure:(void (^)(MyApiLogin *, NSError *))failure
{
    if (phone.isEmpty || pwd.isEmpty || code.isEmpty) {
        return;
    }
    
    NSDictionary *dic = @{@"phone":phone,
                          @"password":pwd,
                          @"code":code};
    
    NSString *urlPath = k_url_register;
    
    [self postWithUrl:urlPath params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            LoginModel *model = [[LoginModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self,model);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"登录失败";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}

//1.3	获取验证码
- (void)sendCodeByPhone:(NSString *)phone
               sendType:(NSString *)type
                Success:(void(^)(MyApiLogin * request))success
                Failure:(void(^)(MyApiLogin * request ,NSError *requestError))failure
{
    if (phone.isEmpty || type.isEmpty) {
        return;
    }
    NSDictionary *dic = @{@"mobile":phone,
                          @"sendType":type};
    
    
    [self postWithUrl:k_url_sendCode params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            BaseModel *model = [[BaseModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"登录失败";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}



@end
