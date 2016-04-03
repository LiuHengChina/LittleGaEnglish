//
//  WeiBaListModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/4/3.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"
#import "LunTanMainModel.h"

@interface WeiBaListModel : BaseModel
@property (nonatomic, strong)NSMutableArray<HotWeibaModel *> *list;
@end
