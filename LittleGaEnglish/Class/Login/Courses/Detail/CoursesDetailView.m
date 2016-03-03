//
//  CoursesDetailView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoursesDetailView.h"

@implementation CoursesDetailView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    self.titleImageView = [UIImageView new];
    [self addSubview:_titleImageView];
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
        make.height.equalTo(@(scales(320)));
    }];
    
    self.defaultView = [UIView new];
    [self addSubview:_defaultView];
    [_defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(_titleImageView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom).offset(-49);
    }];
    
    
    UIView *footerView = [UIView new];
    [self addSubview:footerView];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(@0);
        make.height.equalTo(@49);
    }];
    footerView.backgroundColor = RGBA(232, 232, 232, 1);
    
    UIImageView *favouriteImage = [UIImageView new];
    [footerView addSubview:favouriteImage];
    [favouriteImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY);
        make.left.equalTo(@35);
    }];
    favouriteImage.image = [UIImage imageNamed:@"iconfont-shoucang"];
    
    self.favouruteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:_favouruteBtn];
    [_favouruteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY);
        make.left.equalTo(favouriteImage.mas_right).offset(5);
    }];
    [_favouruteBtn setTitle:@"收藏" forState:UIControlStateNormal];
    _favouruteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_favouruteBtn setTitleColor:RGBA(51, 51, 51, 1) forState:UIControlStateNormal];
    
    UIImageView *loveImage = [UIImageView new];
    [footerView addSubview:loveImage];
    [loveImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerView.mas_centerY);
        make.left.equalTo(_favouruteBtn.mas_right).offset(47);
    }];
    loveImage.image = [UIImage imageNamed:@"iconfont-zan"];
    
    _loveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:_loveBtn];
    [_loveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loveImage.mas_right).offset(9);
        make.centerY.equalTo(footerView.mas_centerY);
    }];
    [_loveBtn setTitle:@"点赞" forState:UIControlStateNormal];
    _loveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_loveBtn setTitleColor:RGBA(51, 51, 51, 1) forState:UIControlStateNormal];
    
    
    _buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:_buyBtn];
    [_buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(@0);
        make.width.equalTo(@127);
    }];
    [_buyBtn setTitle:@"购买该课程" forState:UIControlStateNormal];
    [_buyBtn setBackgroundColor:[UIColor customColorWithString:k_Color_navigation]];
    _buyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
