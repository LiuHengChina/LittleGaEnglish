//
//  KaoTiListModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/19.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "KaoTiListModel.h"

@implementation KaoTiListModel

- (void)setList:(NSMutableArray<KaoTiModel *> *)list
{
    _list = [KaoTiModel arrayOfModelsFromDictionaries:list];
}

@end

@implementation KaoTiModel

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}


@end