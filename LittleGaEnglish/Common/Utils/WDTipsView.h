//
//  WDTipsView.h
//  GoodsDealer
//
//  Created by wufd on 30/10/15.
//  Copyright © 2015年 Ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDTipsView : UIView

+ (instancetype)showTipsViewWithString:(NSString *)str;


+ (instancetype)showTipsViewWithString:(NSString *)str
                             textColor:(UIColor *)textColor
                                  font:(UIFont *)font
                             viewColor:(UIColor *)viewColor;

+ (instancetype)showTipsViewWithString:(NSString *)str
                        showViewHeader:(UIView *)view;

@end
