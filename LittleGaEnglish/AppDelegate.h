//
//  AppDelegate.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/16.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (copy) void (^backgroundSessionCompletionHandler)();


- (void)changeTabBar;

@end

