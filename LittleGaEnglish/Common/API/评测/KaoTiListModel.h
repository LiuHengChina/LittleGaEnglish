//
//  KaoTiListModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/19.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@class KaoTiModel;
@interface KaoTiListModel : BaseModel

@property (nonatomic, strong) NSMutableArray<KaoTiModel *> *list;

@end


@interface KaoTiModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, strong) NSMutableArray *option;
@property (nonatomic, copy) NSString *right_key;
@property (nonatomic, copy) NSString *analyze;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *kj_id;
@end
