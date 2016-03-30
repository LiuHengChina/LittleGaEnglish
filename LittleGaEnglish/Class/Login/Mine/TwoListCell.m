//
//  TwoListCell.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/29.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "TwoListCell.h"

@implementation TwoListCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
