//
//  MIneScoreInfoModel.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/30.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MIneScoreInfoModel.h"

@implementation MIneScoreInfoModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
    [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)setInfoWithDict:(NSDictionary *)dict{
    NSLog(@"%@",dict);
    MIneScoreInfoModel *model = [[MIneScoreInfoModel alloc]initWithDict:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if ([key isEqualToString:@"gradeLevel"]) {
        self.gradeLevel = (NSNumber *)value;
    }
}
@end
