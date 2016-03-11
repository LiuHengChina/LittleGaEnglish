//
//  BuyPreTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyPreTableViewCell.h"

@interface BuyPreTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *codeIsUseLab;
@property (strong, nonatomic) IBOutlet UILabel *douIsUseLab;
@property (strong, nonatomic) IBOutlet UILabel *countLab;

@end


@implementation BuyPreTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (void)setModel:(BuyModel *)model
{
    self.countLab.text = [NSString stringWithFormat:@"共 %@ 咖啡豆",model.product.is_can_exchange_coffee_score];
}

@end
