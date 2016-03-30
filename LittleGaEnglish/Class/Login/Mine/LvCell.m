//
//  LvCell.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "LvCell.h"

@implementation LvCell

- (void)awakeFromNib {
    // Initialization code
}
- (UIImageView *)icon{
    _icon.layer.cornerRadius =_icon.frame.size.width/2;
    return _icon;
}
- (UIView *)viewOfLv{
    _viewOfLv.backgroundColor = [UIColor whiteColor];
    _viewOfLv.layer.borderWidth = 1;
    _viewOfLv.layer.borderColor = [UIColor blueColor].CGColor;
    return _viewOfLv;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
