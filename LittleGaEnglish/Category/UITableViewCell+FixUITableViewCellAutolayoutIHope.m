//
//  UITableViewCell+FixUITableViewCellAutolayoutIHope.m
//  fast
//
//  Created by lirui on 9/5/15.
//  Copyright (c) 2015年 ujuhui. All rights reserved.
//

#import "UITableViewCell+FixUITableViewCellAutolayoutIHope.h"
#import <objc/runtime.h>

@implementation UITableViewCell (FixUITableViewCellAutolayoutIHope)

+ (void)load {
    Method existing = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method new = class_getInstanceMethod(self, @selector(_autolayout_replacementLayoutSubviews));

    method_exchangeImplementations(existing, new);
}

- (void)_autolayout_replacementLayoutSubviews {
    [super layoutSubviews];
    [self _autolayout_replacementLayoutSubviews]; // not recursive due to method swizzling
    [super layoutSubviews];
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [self layoutIfNeeded]; // this line is key
//}

@end
