//
//  UITableViewCell+FixUITableViewCellAutolayoutIHope.h
//  fast
//
//  Created by lirui on 9/5/15.
//  Copyright (c) 2015年 ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>

//用于适配IOS 6。0 autoLayout
@interface UITableViewCell (FixUITableViewCellAutolayoutIHope)

+ (void)load;

- (void)_autolayout_replacementLayoutSubviews;
//- (void)layoutSubviews;

@end
