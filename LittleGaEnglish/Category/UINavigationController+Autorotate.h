//
//  UINavigationController+Autorotate.h
//  TestLandscape
//
//  Created by swhl on 13-4-16.
//  Copyright (c) 2013年 swhl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UjhConfig.h"
@interface UINavigationController (Autorotate)


- (BOOL)shouldAutorotate;

- (NSUInteger)supportedInterfaceOrientations;

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0);

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

@end
