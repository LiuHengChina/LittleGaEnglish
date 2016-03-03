//
//  CALayer+Helper.m
//  fast
//
//  Created by lirui on 9/4/15.
//  Copyright (c) 2015年 ujuhui. All rights reserved.
//

#import "CALayer+Helper.h"

@implementation CALayer (Helper)


- (void)lld_applyAnimation:(CABasicAnimation *)animation {
    if (animation.fromValue == nil) {
        animation.fromValue = [[self presentationLayer] valueForKeyPath:animation.keyPath];
    }
    [self addAnimation:animation forKey:animation.keyPath];
    [self setValue:animation.toValue forKeyPath:animation.keyPath];
}

@end
