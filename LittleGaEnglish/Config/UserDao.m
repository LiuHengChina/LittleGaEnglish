//
//  UserDao.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/23.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "UserDao.h"

NSString *const k_UserDefaults_user = @"k_UserDefaults_user";

@implementation UserDao

+(instancetype)share {
    static UserDao * share = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        share = [[UserDao alloc]init];
    });
    return share;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self getUser];
    }
    return self;
}

-(LoginModel *)getUser {
    if (_user){
        return _user;
    }
    NSObject * obj = [[NSUserDefaults standardUserDefaults] objectForKey:k_UserDefaults_user];
    if ([obj isKindOfClass:[NSMutableDictionary class]]) {
        NSMutableDictionary * dic = (NSMutableDictionary *)obj;
        if (dic && dic.count>0) {
            _user = [[LoginModel alloc]init];
            _user.uid = [dic objectForKey:@"uid"];
            _user.token = [dic objectForKey:@"token"];
            return _user;
        }
    }
    return nil;
}

-(void)setUser:(LoginModel *)user {
    _user = user;
    if (!user){
        _user = nil;
    }else {
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        _user.uid? [dic setObject:_user.uid forKey:@"uid"]:0;
        _user.token?[dic setObject:_user.token forKey:@"token"]:0;
        [[NSUserDefaults standardUserDefaults] setObject:dic forKey:k_UserDefaults_user];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (BOOL)isLogin {
    if (self.user) {
        return YES;
    }
    return NO;
}



@end
