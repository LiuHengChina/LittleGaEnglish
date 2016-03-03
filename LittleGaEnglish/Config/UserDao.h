//
//  UserDao.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/23.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface UserDao : NSObject

@property(nonatomic,strong)LoginModel * user;
+(instancetype)share;

- (BOOL)isLogin;

@end
