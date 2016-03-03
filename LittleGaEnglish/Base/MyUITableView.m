//
//  MyUITableView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyUITableView.h"

@implementation MyUITableView



- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)setCanRefreshHeader:(BOOL)canRefreshHeader
{
    if (canRefreshHeader) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self headerRefreshingBlock];
        }];
    } else {
        [self.mj_header removeFromSuperview];
    }
}

- (void)setCanRefreshFooter:(BOOL)canRefreshFooter
{
    if (canRefreshFooter) {
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self footerRefreshingBlock];
        }];
    } else {
        [self.mj_footer removeFromSuperview];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
