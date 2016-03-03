//
//  MyUIView.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/17.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUIView : UIView


#define scales(num) [self scale:num]

@property (nonatomic, weak) UIViewController * VC;


- (CGFloat)scale:(CGFloat)num;

@end
