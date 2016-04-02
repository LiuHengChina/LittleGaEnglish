//
//  MyApiLunTan.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseNetRequest.h"
#import "LunTanMainModel.h"
#import "LunTanListModel.h"

@interface MyApiLunTan : BaseNetRequest

+ (instancetype)share;

// 论坛首页
- (void)getBBSIndexDataSuccess:(void(^)(MyApiLunTan * request , LunTanMainModel * model))success
                       Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;


// 帖子列表接口
- (void)getThreadListDataID:(NSString *)weibo_id
                     digest:(BOOL)digest
                      order:(NSString *)order
                       page:(NSString *)page
                    Success:(void(^)(MyApiLunTan * request , LunTanListModel * model))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure;



@end
