//
//  MyNavigationController.h
//  usedCar
//
//  Created by Lirui on 14/9/29.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+Autorotate.h"
#import "UIViewController+WDNavResponderAction.h"

@interface MyNavigationController : UINavigationController

@end


#pragma mark - 扩展UIViewController
@interface UIViewController (MyNavigationController)

//default NO   不需要左滑动
@property(nonatomic)BOOL needHandlePanGestureRecognizer;
@property(nonatomic,copy)void(^handlePanGestureBlcok)(void);

@end


