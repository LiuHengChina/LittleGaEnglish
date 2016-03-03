//
//  CoureseDetaiNameCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoureseDetaiNameCell.h"

@interface CoureseDetaiNameCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *classLab;

@property (strong, nonatomic) IBOutlet UILabel *studyCountLab;
@property (strong, nonatomic) IBOutlet UILabel *upLab;  // 点赞
@property (strong, nonatomic) IBOutlet UILabel *loveLab; // 收藏人数

@property (strong, nonatomic) IBOutlet UILabel *priceLab;


@end

@implementation CoureseDetaiNameCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(CourseClassModel *)model
{
    _model = model;
    self.nameLab.text = model.name;
    self.classLab.text = model.lesson_num;
    self.studyCountLab.text = model.learn_num;
    self.upLab.text = model.like_num;
    self.loveLab.text = model.favorite_num;
    self.priceLab.text = model.price;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
