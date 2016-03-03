//
//  LoginModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/23.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@interface LoginModel : BaseModel

@property (nonatomic, copy) NSString *token;
@property (nonatomic, assign) NSString *uid;

@end
