//
//  CoursesDetailMovieTableViewCell.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseDetailModel.h"
@interface CoursesDetailMovieTableViewCell : UITableViewCell

@property (nonatomic, strong) CourseLessonModel *model;
@property (nonatomic, assign) BOOL canPlay;

@end
