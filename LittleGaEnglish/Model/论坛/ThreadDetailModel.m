//
//  ThreadDetailModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/4/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ThreadDetailModel.h"

@implementation ThreadDetailModel

- (void)setReplyList:(NSMutableArray<ThreadDetailReplyModel *> *)replyList
{
    _replyList = [ThreadDetailReplyModel arrayOfModelsFromDictionaries:replyList];
}

@end

@implementation ThreadDetailInfoModel


@end

@implementation ThreadDetailReplyModel


@end