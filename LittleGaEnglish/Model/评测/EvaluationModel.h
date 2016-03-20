//
//  EvaluationModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/14.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@class EvaluationListModel;
@interface EvaluationModel : BaseModel

@property (nonatomic, strong)NSMutableArray<EvaluationListModel *> *list;
@property (nonatomic, assign) BOOL middle_show;
@property (nonatomic, assign) BOOL height_show;
@end

@interface EvaluationListModel : JSONModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *author_id;
@property (nonatomic, copy) NSString *author_name;
@property (nonatomic, copy) NSString *create_time;
@end