//
//  UIActionSheet+MyActionSheet.h
//  GoodsDealer
//
//  Created by Jed on 15/10/27.
//  Copyright © 2015年 Ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (MyActionSheet)

//- (instancetype)initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
+ (instancetype)initMyActionSheetWithTitle:(NSString *)title
                                  delegate:(id<UIActionSheetDelegate>)delegate
                                     block:(void(^)(NSInteger))block
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                    destructiveButtonTitle:(NSString *)destructiveButtonTitle
                         otherButtonTitles:(NSString *)otherButtonTitles, ...;


@end
