//
//  BBCoureseTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBCoureseTableViewCell.h"

@interface BBCoureseTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *desLab;

@property (strong, nonatomic) IBOutlet UILabel *classLab;

@property (strong, nonatomic) IBOutlet UILabel *countLab;

@end

@implementation BBCoureseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(CoureseModel *)model
{
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.cover_url] placeholderImage:nil completed:nil];
    self.title.text = model.name;
    self.desLab.text = model.intro;
    self.classLab.text = model.lesson_num;
    self.countLab.text = model.learn_num;
}



@end
