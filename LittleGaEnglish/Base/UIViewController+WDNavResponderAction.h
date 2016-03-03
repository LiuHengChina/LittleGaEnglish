//
//  UIViewController+WDNavResponderAction.h
//  GoodsDealer
//
//  Created by wufd on 10/6/15.
//  Copyright (c) 2015年 Ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationController.h"

typedef NS_ENUM(NSInteger, WDNavgationBarButtonItemType) {
    WDNavLeftBarTypeBack = 0, //默认左导航按钮类型，返回类型，<
    WDNavLeftBarTypeMenu = 1, //左导航按钮类型，菜单类型三行，=
};

//typedef void(^navItemResponderBlcok)(void);
@interface UIViewController (WDNavResponderAction)

@property (nonatomic,assign)WDNavgationBarButtonItemType leftMenuType;
@property (nonatomic,copy)void(^leftResponderBlock)(void) ;
@property (nonatomic,copy)void(^rightResponderBlock)(void) ;
@property (nonatomic,copy)void(^titleResponderBlock)(UIView *);

/**
 *  导航标题
 *
 *  @param titleString 导航文案
 */
- (void)setCustomNavigationTitle:(NSString *)titleString;
- (void)setCustomNavigationTitle:(NSString *)titleString image:(UIImage *)image respoder:(void(^)(UIView *))titleRespoderBlock;

/**
 *  导航左按钮
 *
 *  @param leftImg      默认白色返回箭头
 *  @param leftTapBlcok 默认是nil，不为nil时左按钮执行blcok，不执行默认操作
 */
- (void)setCustomNavLeftBarButton:(UIImage *)leftImg responderBlcok:(void(^)(void))leftResponderBlock;
- (void)setCustomNavLeftBarButton:(UIImage *)leftImg imageSize:(CGSize)imgSize responderBlcok:(void(^)(void))leftResponderBlock;
- (void)setNavLeftBarButtonItemImage:(UIImage *)leftImg;

- (void)setLeftBarButtonWithString:(NSString *)leftStr responderBlcok:(void(^)(void))leftResponderBlock;
- (void)setNavLeftBarButtonItemWithString:(NSString *)leftStr;
- (void)setLeftNavValue:(NSString *)value color:(UIColor *)color;

/**
 *  导航右按钮
 *
 *  @param rightStr            default nil
 *  @param rightResponderBlock 默认是nil
 */
- (void)setRightBarButtonWithString:(NSString *)rightStr responderBlcok:(void(^)(void))rightResponderBlock;
- (void)setRightBarButtonWithString:(NSString *)rightStr;

- (void)setRightBarButtonWithImage:(UIImage *)image imageSize:(CGSize)imgSize responderBlcok:(void(^)(void))rightResponderBlock;

/**
 *  设置右导航按钮的编辑状态
 *
 *  @param isEditing default Yes 白色。NO灰色不响应点击
 */
- (void)setRightBarButtonEditing:(BOOL)isEditing;

@end
