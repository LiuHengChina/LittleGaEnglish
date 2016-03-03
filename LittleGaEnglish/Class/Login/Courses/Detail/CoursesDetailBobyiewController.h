//
//  CoursesDetailBobyiewController.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "FJSlidingController.h"
#import "CourseDetailModel.h"

@interface CoursesDetailBobyiewController : FJSlidingController

@property (nonatomic, copy) NSString *classId;
@property (nonatomic, strong) CourseDetailModel *model;

@end
