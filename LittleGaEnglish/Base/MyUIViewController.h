//
//  MyUIViewController.h
//  usedCar
//
//  Created by Lirui on 14/10/10.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationController.h"
#import "UIViewController+WDNavResponderAction.h"

@interface MyUIViewController : UIViewController

@property (nonatomic, weak) UIViewController *VC;

- (void)setNavWithColor:(NSString *)color;

@end
