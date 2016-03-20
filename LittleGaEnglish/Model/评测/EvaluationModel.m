//
//  EvaluationModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/14.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "EvaluationModel.h"


@implementation EvaluationModel

- (void)setList:(NSMutableArray<EvaluationListModel *> *)list
{
    _list = [EvaluationListModel arrayOfModelsFromDictionaries:list];
}
@end

@implementation EvaluationListModel
@end