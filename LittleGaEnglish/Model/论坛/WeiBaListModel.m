//
//  WeiBaListModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/4/3.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "WeiBaListModel.h"

@implementation WeiBaListModel

- (void)setList:(NSMutableArray<HotWeibaModel *> *)list
{
    _list = [HotWeibaModel arrayOfModelsFromDictionaries:list];
}

@end
