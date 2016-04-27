//
//  reactlabel.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "reactlabel.h"

@implementation reactlabel
- (void)drawRect:(CGRect)rect
{
    UIEdgeInsets insets = {6, 6, 6, 6};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
    
}
@end
