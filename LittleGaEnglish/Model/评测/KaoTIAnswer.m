//
//  KaoTIAnswer.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "KaoTIAnswer.h"

@implementation KaoTIAnswer

- (void)setErrarr:(NSMutableArray<KaoTiAnswerListModel *> *)Errarr
{
    _Errarr = [KaoTiAnswerListModel arrayOfModelsFromDictionaries:Errarr];
}

@end

@implementation KaoTiAnswerListModel

@end