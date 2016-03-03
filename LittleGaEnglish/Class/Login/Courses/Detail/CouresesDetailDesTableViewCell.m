//
//  CouresesDetailDesTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CouresesDetailDesTableViewCell.h"

@interface CouresesDetailDesTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *desLab;

@end


@implementation CouresesDetailDesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(CourseClassModel *)model
{
    _model = model;
    self.desLab.text = model.intro;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
