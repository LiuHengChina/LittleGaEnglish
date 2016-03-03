//
//  BaseModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/22.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BaseModel : JSONModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString * info;

@property (nonatomic, strong) NSArray *data;

@end
