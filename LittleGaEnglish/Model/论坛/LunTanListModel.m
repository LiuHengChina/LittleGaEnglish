//
//  LunTanListModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/4/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "LunTanListModel.h"

@implementation LunTanListModel

- (void)setList:(NSMutableArray<HotThreadModel *> *)list
{
    _list = [HotThreadModel arrayOfModelsFromDictionaries:list];
}

@end
