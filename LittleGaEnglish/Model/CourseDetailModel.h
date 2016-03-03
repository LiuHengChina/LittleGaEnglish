//
//  CourseDetailModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@class CourseLessonModel;
@class CourseClassModel;
@class CourseCommentModel;
@class CourseEvalModel;

@interface CourseDetailModel : BaseModel

@property (nonatomic, strong) CourseClassModel *courseClass;
@property (nonatomic, strong) NSMutableArray<CourseLessonModel *> *lesson_list;
@property (nonatomic, strong) CourseCommentModel *mycomment;

@end

@interface CourseClassModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *cover_url;
@property (nonatomic, copy) NSString *lesson_num;
@property (nonatomic, copy) NSString *learn_num;
@property (nonatomic, copy) NSString *favorite_num;
@property (nonatomic, copy) NSString *like_num;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *is_has_set_meal;
@property (nonatomic, copy) NSString *is_can_watch_all;
@property (nonatomic, copy) NSString *is_can_order;
@property (nonatomic, copy) NSString *is_has_order;
@property (nonatomic, copy) NSString *is_can_favorite;
@property (nonatomic, copy) NSString *is_can_like;
@property (nonatomic, copy) NSString *is_can_comment_class;

@end

@interface CourseLessonModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *lesson_order;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *video_id;
@property (nonatomic, copy) NSString *cover_url;

@end

@interface CourseCommentModel : JSONModel;

@property (nonatomic, strong) NSMutableArray<CourseEvalModel *> *list;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *avg_star;

@end

@interface CourseEvalModel : JSONModel

@property (nonatomic, copy) NSString *command_id;
@property (nonatomic, copy) NSString *command_content;
@property (nonatomic, copy) NSString *command_star;
@property (nonatomic, copy) NSString *command_time;
@property (nonatomic, copy) NSString *command_user_id;
@property (nonatomic, copy) NSString *command_user_name;
@property (nonatomic, copy) NSString *command_user_avatar;

@end
