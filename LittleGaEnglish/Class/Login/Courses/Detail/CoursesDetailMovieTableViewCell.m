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
    
    UITapGestureRecognizer *palyTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playAction)];
    [self.playImage addGestureRecognizer:palyTap];
    
    
    
    UITapGestureRecognizer *buyTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buyAction)];
    [self.buyImage addGestureRecognizer:buyTap];
    
    self.buyImage.userInteractionEnabled = YES;
    self.playImage.userInteractionEnabled = YES;
}

- (void) playAction{
    if (self.playBlock) {
        self.playBlock();
    }
}


- (void) buyAction{
    if (self.buyBlock) {
        self.buyBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (void)setCanPlay:(BOOL)canPlay
{
    self.buyImage.hidden = canPlay;
    self.playImage.hidden = !canPlay;
}

- (void)setModel:(CourseLessonModel *)model
{
    _model = model;
    _nameLab.text = model.name;
    [_CoverImage sd_setImageWithURL:[NSURL URLWithString:@"cover_url"] placeholderImage:nil completed:nil];
}

@end
