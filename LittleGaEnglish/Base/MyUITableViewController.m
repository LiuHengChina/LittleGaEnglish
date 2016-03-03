//
//  MyTableViewController.m
//  usedCar
//
//  Created by Lirui on 14/10/29.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "MyUITableViewController.h"
#import "SDImageCache.h"


@interface MyUITableViewController ()

@end

@implementation MyUITableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }

//    if (kAppRunServerIsRelease && [kAppRunServerIsRelease isEqualToString:@"YES"]) {
//        [[UIApplication sharedApplication] setStatusBarOrientation:(UIInterfaceOrientationPortrait|UIInterfaceOrientationPortraitUpsideDown|UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationLandscapeRight)]; //UIInterfaceOrientationPortrait];
//    }
}


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
    // Dispose of any resources that can be recreated.
    [[SDImageCache sharedImageCache]clearMemory];
}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

#pragma mark - 控制APP方向
//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//
//-(BOOL)shouldAutorotate {
//    return YES;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
//}
//
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.interfaceOrientation;
}

@end
