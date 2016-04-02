//
//  LunTanMainModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@class singModel;
@class HotWeibaModel;
@class HotTopicModel;
@class HotThreadModel;

@interface LunTanMainModel : BaseModel

@property (nonatomic, strong) singModel *signArr;
@property (nonatomic, strong) NSMutableArray<HotTopicModel *> *hotTopic;
@property (nonatomic, strong) NSMutableArray<HotWeibaModel *> *hotWeiba;
@property (nonatomic, strong) NSMutableArray<HotThreadModel *> *hotThread;

@end


@interface singModel : JSONModel
@property (nonatomic, assign) BOOL isSign;
@property (nonatomic, copy) NSString *lxSignDay; // 连续签到次数
@end

@interface HotTopicModel : JSONModel

@property (nonatomic, copy) NSString *topic_id;
@property (nonatomic, copy) NSString *topic_name;

@end


@interface HotWeibaModel : JSONModel

@property (nonatomic, copy) NSString *avatar_middle;
@property (nonatomic, copy) NSString *weiba_id;
@property (nonatomic, copy) NSString *weiba_name;

@end

@interface HotThreadModel : JSONModel

@property (nonatomic, copy)NSString *post_id;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *imgurl;
@property (nonatomic, copy)NSString *praise;
@property (nonatomic, copy)NSString *favorite;
@property (nonatomic, copy)NSString *reply_count;

@end

