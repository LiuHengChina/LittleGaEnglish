//
//  KaoTiErrorModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/25.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@interface KaoTiErrorModel : BaseModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSMutableArray *option;
@property (nonatomic, copy) NSString *right_key;
@property (nonatomic, copy) NSString *user_answer;
@property (nonatomic, copy) NSString *analyze;

@end
