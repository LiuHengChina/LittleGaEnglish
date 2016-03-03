//
//  MyUIViewController.m
//  usedCar
//
//  Created by Lirui on 14/10/10.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "MyUIViewController.h"
#import "SDImageCache.h"

@interface MyUIViewController ()

@end

@implementation MyUIViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    if (kAppRunServerIsRelease && [kAppRunServerIsRelease isEqualToString:@"YES"]) {
//        [[UIApplication sharedApplication] setStatusBarOrientation:(UIInterfaceOrientationPortrait|UIInterfaceOrientationPortraitUpsideDown|UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationLandscapeRight)];//]UIInterfaceOrientationPortrait];
//    }
}

- (void)setNav{
    [self setNavWithColor:k_Color_navigation];
}

- (void)setNavWithColor:(NSString *)color {
    if (kSYSTEMNAME_AND_VERSION >= 7.0){
        self.navigationController.navigationBar.barTintColor = [UIColor customColorWithString:color];
        [[UINavigationBar appearance]setBarTintColor:[UIColor customColorWithString:color]];
    }else{
        self.navigationController.navigationBar.tintColor = [UIColor customColorWithString:color];
        [[UINavigationBar appearance]setTintColor:[UIColor customColorWithString:color]];
    }
    self.navigationController.navigationBar.backgroundColor = [UIColor customColorWithString:color];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor customColorWithString:k_Color_f4f4f6];
    self.needHandlePanGestureRecognizer = YES;
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
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return YES;
}

-(BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {

    return UIInterfaceOrientationMaskAll;

}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {

    return self.interfaceOrientation;
//    return UIInterfaceOrientationPortrait;
}

@end
