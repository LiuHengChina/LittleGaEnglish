//
//  BuyMealTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyMealTableViewCell.h"
#import "BuyMealView.h"

@interface BuyMealTableViewCell ()
@property (strong, nonatomic) IBOutlet UIView *defaultView;
@property (strong, nonatomic) IBOutlet UIButton *isBuyBtn;
@property (strong, nonatomic) IBOutlet UILabel *priceLab;
@property (strong, nonatomic) IBOutlet UILabel *allPriceLab;

@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation BuyMealTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setModel:(BuyMealModel *)model
{
    _model = model;
    self.priceLab.text = model.price;
    self.allPriceLab.text = model.original_price;
    
    self.scrollView = [UIScrollView new];
    [_defaultView addSubview:_scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(@0);
    }];
    
    self.userInteractionEnabled = YES;
    UIView *lastView = nil;
    for (int i = 0; i < model.class_list.count; i ++) {
        BuyMealView *view = [BuyMealView new];
        [_scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!lastView) {
                make.left.equalTo(@10);
            } else{
                make.left.equalTo(lastView.mas_right).offset(10);
            }
            make.top.equalTo(@0);
            make.width.equalTo(@110);
            make.bottom.equalTo(@0);
            
        }];
        view.model = model.class_list[i];
        lastView = view;
    }
    if (lastView) {
        [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(lastView.mas_right);
        }];
    }

    
    
}

@end
