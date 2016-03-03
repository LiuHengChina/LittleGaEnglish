//
//  LoginModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/23.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel


- (NSString *)uid
{
    if (_uid.isEmpty) {
        _uid = @"";
    }
    return _uid;
}


- (NSString *)token
{
    if (_token.isEmpty) {
        _token = @"";
    }
    return _token;
}

@end
