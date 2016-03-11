//
//  BuyMealView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/5.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyMealView.h"

@interface BuyMealView ()

@property (nonatomic, strong) UIImageView *defaultIamge;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *priceLab;

@end

@implementation BuyMealView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addAllView];
    }
    return self;
}

- (void)addAllView
{
    self.defaultIamge = [UIImageView new];
    [self addSubview:_defaultIamge];
    [_defaultIamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.top.bottom.equalTo(@0);
    }];
    
    self.titleLab = [UILabel new];
    [_defaultIamge addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@5);
        make.right.equalTo(self.mas_right).offset(-5);
    }];
    
    self.priceLab = [UILabel new];
    [_defaultIamge addSubview:_priceLab];
    [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
    _priceLab.textAlignment = NSTextAlignmentRight;
    
    _priceLab.font = [UIFont systemFontOfSize:11];
    _titleLab.font = [UIFont systemFontOfSize:11];
    _priceLab.textColor = [UIColor whiteColor];
    _titleLab.textColor = [UIColor whiteColor];
}

- (void)setModel:(BuyClassListModel *)model
{
    [_defaultIamge sd_setImageWithURL:[NSURL URLWithString:model.class_cover_url] placeholderImage:nil completed:nil];
    _priceLab.text = [NSString stringWithFormat:@"原价: %@",model.class_price];
    _titleLab.text = model.class_name;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
