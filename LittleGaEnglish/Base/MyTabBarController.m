//
//  MyTabBarController.m
//  usedCar
//
//  Created by Lirui on 14/9/29.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "MyTabBarController.h"
#import "SDImageCache.h"

@interface MyTabBarController ()
@end

@implementation MyTabBarController
- (void)setNav{
    if (kSYSTEMNAME_AND_VERSION >= 7.0){
        self.navigationController.navigationBar.barTintColor = [UIColor customColorWithString:k_Color_navigation];
        [[UINavigationBar appearance]setBarTintColor:[UIColor customColorWithString:k_Color_navigation]];
    }else{
        self.navigationController.navigationBar.tintColor = [UIColor customColorWithString:k_Color_navigation];
        [[UINavigationBar appearance]setTintColor:[UIColor customColorWithString:k_Color_navigation]];
    }
    self.navigationController.navigationBar.backgroundColor = [UIColor customColorWithString:k_Color_navigation];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    self.needHandlePanGestureRecognizer = YES;
    self.view.backgroundColor = [UIColor customColorWithString:k_Color_f4f4f6];
//    self.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[SDImageCache sharedImageCache]clearMemory];
}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

#pragma mark - 控制APP方向
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return [self.selectedViewController
            shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController
            supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
