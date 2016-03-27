//
//  LunTanMainModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "LunTanMainModel.h"

@implementation LunTanMainModel

- (void)setHotTopic:(NSMutableArray<HotTopicModel *> *)hotTopic
{
    _hotTopic = [HotTopicModel arrayOfModelsFromDictionaries:hotTopic];
}

- (void)setHotWeiba:(NSMutableArray<HotWeibaModel *> *)hotWeiba
{
    _hotWeiba = [HotWeibaModel arrayOfModelsFromDictionaries:hotWeiba];
}

- (void)setHotThread:(NSMutableArray<HotThreadModel *> *)hotThread
{
    _hotThread = [HotThreadModel arrayOfModelsFromDictionaries:hotThread];
}

@end
@implementation singModel

@end
@implementation HotWeibaModel

@end
@implementation HotTopicModel

@end
@implementation HotThreadModel

@end