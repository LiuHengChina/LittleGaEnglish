//
//  MyApiLunTan.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"
#import "LunTanMainModel.h"

@interface MyApiLunTan : BaseNetRequest

+ (instancetype)share;

// 论坛首页
- (void)getBBSIndexDataSuccess:(void(^)(MyApiLunTan * request , LunTanMainModel * model))success
                       Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;

@end
