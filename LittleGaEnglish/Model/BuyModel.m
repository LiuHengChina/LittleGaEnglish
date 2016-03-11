//
//  BuyModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/5.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyModel.h"

@implementation BuyModel

@end

@implementation BuyProductModel


@end

@implementation BuyMealModel

- (void)setClass_list:(NSMutableArray<BuyClassListModel *> *)class_list
{
    _class_list = [BuyClassListModel arrayOfModelsFromDictionaries:class_list];
}

@end

@implementation BuyClassListModel


@end