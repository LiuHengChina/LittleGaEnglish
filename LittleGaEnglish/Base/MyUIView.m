//
//  MyUIView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/17.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyUIView.h"

@implementation MyUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endEdit)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (CGFloat)scale:(CGFloat)num
{
    return num / 2.0 * kSYSTEM_SCREEN_HEIGHT / 667.0;
}

- (void)endEdit
{
    [self endEditing:YES];
}

@end
