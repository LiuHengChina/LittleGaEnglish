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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushLogin:(id)sender {
    BBLoginViewController *loginVC = [BBLoginViewController new];
    loginVC.selectIndex = 1;
    [self presentViewController:loginVC animated:YES completion:nil];
}
- (IBAction)RootAction:(id)sender {
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app changeTabBar];
}

@end
