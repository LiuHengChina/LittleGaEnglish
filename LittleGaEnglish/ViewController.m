//
//  ViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/16.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ViewController.h"
#import "BBLoginViewController.h"
#import "RootTabBarController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"enter");
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *LoginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    LoginButton.frame = CGRectMake(20, 20, 200, 200);
    [self.view addSubview:LoginButton];
    [LoginButton setTitle:@"登录" forState:UIControlStateNormal];
    [LoginButton addTarget:self action:@selector(pushLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *MainButton = [UIButton buttonWithType:UIButtonTypeSystem];
    MainButton.frame = CGRectMake(20, 230, 200, 200);
    [self.view addSubview:MainButton];
    [MainButton setTitle:@"首页" forState:UIControlStateNormal];
    [MainButton addTarget:self action:@selector(RootAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushLogin:(id)sender {
    BBLoginViewController *loginVC = [BBLoginViewController new];
    loginVC.selectIndex = 1;
    [self presentViewController:loginVC animated:YES completion:nil];
}
- (void)RootAction:(id)sender {
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app changeTabBar];
}




//- (IBAction)pushLogin:(id)sender {
//    BBLoginViewController *loginVC = [BBLoginViewController new];
//    loginVC.selectIndex = 1;
//    [self presentViewController:loginVC animated:YES completion:nil];
//}
//- (IBAction)RootAction:(id)sender {
//    
//    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [app changeTabBar];
//}

@end
