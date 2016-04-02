//
//  LunTanListModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/4/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"
#import "LunTanMainModel.h"

@class HotThreadModel;
@interface LunTanListModel : BaseModel

@property (nonatomic, copy) NSString *weiba_name;
@property (nonatomic, strong) NSMutableArray<HotThreadModel *>* list;

@end
