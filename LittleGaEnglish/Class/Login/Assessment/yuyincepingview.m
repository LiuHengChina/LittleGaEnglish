//
//  yuyincepingview.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/12.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "yuyincepingview.h"

@interface yuyincepingview ()
@property (strong, nonatomic) IBOutlet UIButton *boolkaishi;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;

@end

@implementation yuyincepingview
//未开始weikaishiyuanjiao 开始图片weikaishiyuanjiao，自己根据数据换
- (void)awakeFromNib {
}

- (IBAction)beginAction:(id)sender {
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
            [self.boolkaishi setImage:[UIImage imageNamed:@"kaishiyuanjiao"] forState:UIControlStateNormal];
            self.title.text = @"初级";
        }
            break;
        case 1:{
            if (self.middle_show) {
                            [self.boolkaishi setImage:[UIImage imageNamed:@"kaishiyuanjiao"] forState:UIControlStateNormal];
            } else {
                            [self.boolkaishi setImage:[UIImage imageNamed:@"weikaishiyuanjiao"] forState:UIControlStateNormal];
                self.boolkaishi.userInteractionEnabled = NO;
            }
            self.title.text = @"中级";
        }
            break;
        case 2:{
            if (self.height_show) {
                [self.boolkaishi setImage:[UIImage imageNamed:@"kaishiyuanjiao"] forState:UIControlStateNormal];
            } else {
                [self.boolkaishi setImage:[UIImage imageNamed:@"weikaishiyuanjiao"] forState:UIControlStateNormal];
                self.boolkaishi.userInteractionEnabled = NO;
            }
            self.title.text = @"高级";
        }
            break;
        default:
            break;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
