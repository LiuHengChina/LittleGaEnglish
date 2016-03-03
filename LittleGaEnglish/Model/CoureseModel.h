//
//  CoureseModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@interface CoureseModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;    // 课程描述
@property (nonatomic, copy) NSString *cover_url;    // 封面图片
@property (nonatomic, copy) NSString *lesson_num;   // 课程数
@property (nonatomic, copy) NSString *learn_num;    // 学习人数

@end
