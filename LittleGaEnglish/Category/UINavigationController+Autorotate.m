//
//  UINavigationController+Autorotate.m
//  TestLandscape
//
//  Created by swhl on 13-4-16.
//  Copyright (c) 2013年 swhl. All rights reserved.
//

#import "UINavigationController+Autorotate.h"


@implementation UINavigationController (Autorotate)


//返回最上层的子Controller的shouldAutorotate
//子类要实现屏幕旋转需重写该方法
- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

//返回最上层的子Controller的supportedInterfaceOrientations
- (NSUInteger)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0) {
    return [self.topViewController
            shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
