//
//  MIneScoreInfoModel.h
//  LittleGaEnglish
//
//  Created by  mac on 16/3/30.
//  Copyright © 2016年 Jed. All rights reserved.
//
/*
头像	portrait
积分值	score
经验值	experience
用户等级编号	gradeLevel
用户等级名	gradeName
gradeImage
该等级开始经验	gradeStart
该等级结束经验	gradeEnd
升级所需经验值	upgradeGap
 */
#import <Foundation/Foundation.h>

@interface MIneScoreInfoModel : NSObject
@property (nonatomic ,strong)NSString *experience;//经验值
@property (nonatomic ,strong)NSString *portrait;//头像
@property (nonatomic ,strong)NSString *score;//积分值
@property (nonatomic ,assign)NSNumber *gradeLevel;//用户等级编号
@property (nonatomic ,strong)NSString *upgradeGap;//升级所需经验值
@property (nonatomic ,strong)NSString *gradeEnd;//该等级结束经验
@property (nonatomic ,strong)NSString *gradeStart;//该等级开始经验
@property (nonatomic ,strong)NSString *gradeName;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)setInfoWithDict:(NSDictionary *)dict;
@end
