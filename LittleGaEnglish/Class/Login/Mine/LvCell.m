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
    
//    _viewOfLv.layer.cornerRadius = 5;
    _viewOfLv.backgroundColor = [UIColor whiteColor];
    _viewOfLv.layer.borderWidth = 1;
    _viewOfLv.layer.borderColor = RGBA(105, 169, 238, 1).CGColor;
}
- (UIImageView *)icon{
    _icon.layer.cornerRadius =_icon.frame.size.width/2;
    return _icon;
}
- (UIView *)viewOfLv{
    _viewOfLv.layer.cornerRadius = 5;
    _viewOfLv.backgroundColor = [UIColor whiteColor];
    _viewOfLv.layer.borderWidth = 1;
    _viewOfLv.layer.borderColor = RGBA(105, 169, 238, 1).CGColor;
    return _viewOfLv;
}

@end
