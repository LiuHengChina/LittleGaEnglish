//
//  HomeTableViewCell.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *titleLab;
@property (strong, nonatomic) IBOutlet UIButton *titleBtn;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation HomeTableViewCell


- (void)awakeFromNib {
    [self addAllViews];
}

- (void)addAllViews
{
    self.scrollView = [UIScrollView new];
    [self addSubview:_scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(_titleLab.mas_bottom).offset(10);
    }];
    
    self.userInteractionEnabled = YES;
    UIView *lastView = nil;
    for (int i = 0; i < 5; i ++) {
        HomeTableViewCellItem *item = [HomeTableViewCellItem new];
        [self.scrollView addSubview:item];
        item.imageView.backgroundColor = [UIColor redColor];
        item.titleLab.text = [NSString stringWithFormat:@"%d",i];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!lastView) {
                make.left.equalTo(@0);
            } else{
                make.left.equalTo(lastView.mas_right);
            }
            make.top.equalTo(@0);
            make.width.equalTo(@130);
            make.bottom.equalTo(@0);
        }];
        lastView = item;
    }
    
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_right);
    }];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)titleBtnAction:(id)sender {
}

@end



@implementation HomeTableViewCellItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews{
    
    self.imageView = [UIImageView new];
    [self addSubview:_imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@10);
        make.right.equalTo(@0);
        make.height.equalTo(@73);
    }];
    
    self.titleLab = [UILabel new];
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_bottom).offset(5);
        make.left.equalTo(_imageView.mas_left);
        make.right.equalTo(_imageView.mas_right);
    }];
    _titleLab.font = [UIFont systemFontOfSize:12];
    _titleLab.textColor = RGBA(80, 80, 80, 1);
}

@end