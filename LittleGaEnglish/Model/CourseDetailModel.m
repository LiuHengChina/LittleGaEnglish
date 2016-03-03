//
//  CourseDetailModel.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CourseDetailModel.h"

@implementation CourseDetailModel

- (void)setLesson_list:(NSMutableArray<CourseLessonModel *> *)lesson_list
{
    _lesson_list = [CourseLessonModel arrayOfModelsFromDictionaries:lesson_list];
}

@end


@implementation CourseClassModel

@end

@implementation CourseLessonModel

@end

@implementation CourseCommentModel

- (void)setList:(NSMutableArray<CourseEvalModel *> *)list
{
    _list = [CourseEvalModel arrayOfModelsFromDictionaries:list];
}

@end

@implementation CourseEvalModel


@end