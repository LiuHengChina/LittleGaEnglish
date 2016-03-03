//
//  CoursesEvalViewController.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/29.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyUIViewController.h"

#import "CourseDetailModel.h"

@interface CoursesEvalViewController : MyUIViewController

@property (nonatomic, copy) NSString *courseID;
@property (nonatomic, strong) CourseDetailModel *detailModel;
@property (nonatomic, strong) CourseCommentModel *model;

@end
