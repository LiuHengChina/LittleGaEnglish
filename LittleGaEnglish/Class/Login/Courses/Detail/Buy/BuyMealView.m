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
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(@125);
        make.height.equalTo(@75);
    }];
    
    
    self.titleLab = [UILabel new];
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
