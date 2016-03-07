//
//  BuyHeaderTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/1.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyHeaderTableViewCell.h"

@interface BuyHeaderTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *priceLab;

@end


@implementation BuyHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setModel:(BuyProductModel *)model
{
    self.nameLab.text = model.name;
    self.priceLab.text = model.price;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
