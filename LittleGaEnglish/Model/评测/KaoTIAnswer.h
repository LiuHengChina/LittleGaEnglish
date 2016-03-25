//
//  KaoTIAnswer.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@class KaoTiAnswerListModel;
@interface KaoTIAnswer : BaseModel

@property (nonatomic, copy) NSString *score;
@property (nonatomic, strong) NSMutableArray<KaoTiAnswerListModel *> *Errarr;
@end

@interface KaoTiAnswerListModel : BaseModel

@property (nonatomic, copy) NSString * Order;   //错题记录号 1-10的那个记录
@property (nonatomic, copy) NSString * errktid; // 数据库中错题记录日志的主键id，查看错题解析时需要用到该id值
@end
