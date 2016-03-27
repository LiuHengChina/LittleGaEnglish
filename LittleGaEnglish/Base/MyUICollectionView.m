//
//  MyUICollectionView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyUICollectionView.h"

@implementation MyUICollectionView

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


@end
