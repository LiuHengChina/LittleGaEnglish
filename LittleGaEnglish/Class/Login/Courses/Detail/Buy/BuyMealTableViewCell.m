//
//  BuyMealTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyMealTableViewCell.h"


@interface BuyMealTableViewCell ()
@property (strong, nonatomic) IBOutlet UIView *defaultView;
@property (strong, nonatomic) IBOutlet UIButton *isBuyBtn;
@property (strong, nonatomic) IBOutlet UILabel *priceLab;
@property (strong, nonatomic) IBOutlet UILabel *allPriceLab;

@end

@implementation BuyMealTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setModel:(BuyMealModel *)model
{
    self.priceLab.text = model.price;
    self.allPriceLab.text = model.original_price;
}

@end
