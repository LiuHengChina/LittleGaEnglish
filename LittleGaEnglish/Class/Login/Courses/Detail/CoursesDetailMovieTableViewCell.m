//
//  CoursesDetailMovieTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoursesDetailMovieTableViewCell.h"

@interface CoursesDetailMovieTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLab;

@property (strong, nonatomic) IBOutlet UIImageView *CoverImage; // 首页

@property (strong, nonatomic) IBOutlet UIImageView *buyImage;

@property (strong, nonatomic) IBOutlet UIImageView *playImage;

@end

@implementation CoursesDetailMovieTableViewCell

- (void)awakeFromNib {
    self.playImage.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (void)setCanPlay:(BOOL)canPlay
{
    self.buyImage.hidden = canPlay;
    self.playImage.hidden = !canPlay;
}

@end
