//
//  TopicDetailModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/4/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "TopicDetailModel.h"

@implementation TopicDetailModel

- (void)setReplyList:(NSMutableArray<TopicDetailReplyModel *> *)replyList
{
    _replyList = [TopicDetailReplyModel arrayOfModelsFromDictionaries:replyList];
}

@end

@implementation TopicDetaiInfoModel

@end

@implementation TopicDetailReplyModel


@end
