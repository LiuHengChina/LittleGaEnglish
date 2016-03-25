//
//  dancipingcecellTableViewCell.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/13.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "dancipingcecellTableViewCell.h"



@interface dancipingcecellTableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;
@property (strong, nonatomic) IBOutlet UIButton *shifoukaishi;

@end

@implementation dancipingcecellTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.shifoukaishi addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)sender
{
    if (self.chickBeginBlock) {
        self.chickBeginBlock();
    }
}

- (void)setModel:(EvaluationListModel *)model
{
    _model = model;
    self.subtitle.text = model.name;
    switch (model.level.intValue) {
        case 0:{
            [self.shifoukaishi setImage:[UIImage imageNamed:@"kaishiyuanjiao"] forState:UIControlStateNormal];
            self.title.text = @"初级";
        }
            break;
        case 1:{
            if (self.middle_show) {
                [self.shifoukaishi setImage:[UIImage imageNamed:@"kaishiyuanjiao"] forState:UIControlStateNormal];
            } else {
                [self.shifoukaishi setImage:[UIImage imageNamed:@"weikaishiyuanjiao"] forState:UIControlStateNormal];
                self.shifoukaishi.userInteractionEnabled = NO;
            }
            self.title.text = @"中级";
        }
            break;
        case 2:{
            if (self.height_show) {
                [self.shifoukaishi setImage:[UIImage imageNamed:@"kaishiyuanjiao"] forState:UIControlStateNormal];
            } else {
                [self.shifoukaishi setImage:[UIImage imageNamed:@"weikaishiyuanjiao"] forState:UIControlStateNormal];
                self.shifoukaishi.userInteractionEnabled = NO;
            }
            self.title.text = @"高级";
        }
            break;
        default:
            break;
    }
}


//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
