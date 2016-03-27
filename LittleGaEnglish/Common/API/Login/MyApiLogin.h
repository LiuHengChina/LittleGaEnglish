//
//  MyApiLogin.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/23.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"
#import "LoginModel.h"

@interface MyApiLogin : BaseNetRequest

+ (instancetype)share;

- (void)sendRequestWithPhone:(NSString *)phone
                         pwd:(NSString *)pwd
                     Success:(void(^)(MyApiLogin * request , LoginModel * model))success
                     Failure:(void(^)(MyApiLogin * request ,NSError *requestError))failure;

- (void)registerWithPhone:(NSString *)phone
                      pwd:(NSString *)pwd
                     code:(NSString *)code
                  Success:(void(^)(MyApiLogin * request , LoginModel * model))success
                  Failure:(void(^)(MyApiLogin * request ,NSError *requestError))failure;

//1.3	获取验证码
- (void)sendCodeByPhone:(NSString *)phone
               sendType:(NSString *)type
                Success:(void(^)(MyApiLogin * request))success
                Failure:(void(^)(MyApiLogin * request ,NSError *requestError))failure;


@end
