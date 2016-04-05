//
//  ThreadDetailModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/4/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"
@class ThreadDetailInfoModel;
@class ThreadDetailReplyModel;

@interface ThreadDetailModel : BaseModel

@property (nonatomic, strong) ThreadDetailInfoModel *threadInfo;
@property (nonatomic, strong) NSMutableArray <ThreadDetailReplyModel *> *replyList;

@end

@interface ThreadDetailInfoModel : BaseModel

@property (nonatomic, copy) NSString *weiba_name;
@property (nonatomic, copy) NSString *post_id;
@property (nonatomic, copy) NSString *post_uid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *authority_level;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *post_time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *voice_url;
@property (nonatomic, copy) NSString *favorite;
@property (nonatomic, copy) NSString *praise;
@property (nonatomic, copy) NSString *reply_count;
@property (nonatomic, copy) NSString *voice_time_long;

@end

@interface ThreadDetailReplyModel : BaseModel

@property (nonatomic, copy) NSString *reply_id;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *ctime;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *imgurl;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *voice_url;
@property (nonatomic, copy) NSString *voice_time_long;

@end

