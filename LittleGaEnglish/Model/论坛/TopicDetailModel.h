//
//  TopicDetailModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/4/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"
@class TopicDetaiInfoModel;
@class TopicDetailReplyModel;
@interface TopicDetailModel : BaseModel

@property (nonatomic, strong) NSMutableArray <TopicDetailReplyModel *> *replyList;
@property (nonatomic, strong)TopicDetaiInfoModel *topicInfo;

@end

@interface TopicDetaiInfoModel : BaseModel

@property (nonatomic, copy) NSString *topic_name;
@property (nonatomic, copy) NSString *creater;
@property (nonatomic, copy) NSString *Count;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *img_url;
@property (nonatomic, copy) NSString *voice_url;
@property (nonatomic, copy) NSString *flashimg;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *voice_time_long;

@end

@interface TopicDetailReplyModel : BaseModel

@property(nonatomic, copy) NSString *uid;
@property(nonatomic, copy) NSString *feed_id;
@property(nonatomic, copy) NSString *uname;
@property(nonatomic, copy) NSString *avatar;
@property(nonatomic, copy) NSString *publish_time;
@property(nonatomic, copy) NSString *feed_content;
@property(nonatomic, copy) NSString *img_url;
@property(nonatomic, copy) NSString *flashimg;
@property(nonatomic, copy) NSString *video_url;
@property(nonatomic, copy) NSString *voice_url;
@property(nonatomic, copy) NSString *comment_count;
@property(nonatomic, copy) NSString *dignum;
@property (nonatomic, copy) NSString *voice_time_long;
@property(nonatomic, assign) BOOL isdig;


@end
