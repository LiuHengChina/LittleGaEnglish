//
//  CoursesDetailDesViewController.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyUIViewController.h"

#import "CourseDetailModel.h"

@interface CoursesDetailDesViewController : MyUIViewController

@property (nonatomic, strong) CourseDetailModel *model;
@property (nonatomic, copy) NSString *courseID;

@end
