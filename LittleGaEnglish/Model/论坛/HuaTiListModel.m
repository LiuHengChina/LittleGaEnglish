//
//  HuaTiListModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/4/3.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "HuaTiListModel.h"

@implementation HuaTiListModel

- (void)setList:(NSMutableArray<HotTopicModel *> *)list
{
    _list = [HotTopicModel arrayOfModelsFromDictionaries:list];
}
@end
