//
//  CoureseEvalTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/29.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoureseEvalTableViewCell.h"
#import "BBStarView.h"

@interface CoureseEvalTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UILabel *desLab;
@property (strong, nonatomic) IBOutlet BBStarView *starView;

@end


@implementation CoureseEvalTableViewCell

- (void)awakeFromNib {
    self.starView.canEdit = NO;
    // Initialization code
}

- (void)setModel:(CourseEvalModel *)model
{
    _model = model;
    [_image sd_setImageWithURL:[NSURL URLWithString:model.command_user_avatar] placeholderImage:nil completed:nil];
    self.nameLab.text = model.command_user_name;
    self.timeLab.text = model.command_time;
    self.desLab.text = model.command_content;
    self.starView.count = model.command_star.intValue;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
