//
//  RootTabBarController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "RootTabBarController.h"
#import "MyNavigationController.h"
#import "CoursesViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "ForumViewController.h"
#import "AssessMentViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *HomeVC =[[HomeViewController alloc]init];
    HomeVC.tabBarItem.title=@"首页";
    HomeVC.tabBarItem.image=[UIImage imageNamed:@"home_default"];
    HomeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_select"];
    MyNavigationController *HomeNV = [[MyNavigationController alloc]initWithRootViewController:HomeVC];
    
    AssessMentViewController *AssessVC =[[AssessMentViewController alloc]init];
    AssessVC.tabBarItem.title=@"评测";
    AssessVC.tabBarItem.image=[UIImage imageNamed:@"home_default"];
    AssessVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_select"];
    MyNavigationController *AssessNC = [[MyNavigationController alloc]initWithRootViewController:AssessVC];
    
    CoursesViewController *CourseVC =[[CoursesViewController alloc]init];
    CourseVC.tabBarItem.title=@"课程";
    CourseVC.tabBarItem.image=[UIImage imageNamed:@"course_default"];
    CourseVC.tabBarItem.selectedImage = [UIImage imageNamed:@"course_select"];
    MyNavigationController *CourseNC = [[MyNavigationController alloc]initWithRootViewController:CourseVC];
    
    ForumViewController *ForumVC =[[ForumViewController alloc]init];
    ForumVC.tabBarItem.title=@"课程";
    ForumVC.tabBarItem.image=[UIImage imageNamed:@"forum_default"];
    ForumVC.tabBarItem.selectedImage = [UIImage imageNamed:@"forum_select"];
    MyNavigationController *ForumNC = [[MyNavigationController alloc]initWithRootViewController:ForumVC];
    
    MineViewController *MineVC = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil]instantiateViewControllerWithIdentifier:@"MineViewController"];
    MineVC.tabBarItem.title=@"课程";
    MineVC.tabBarItem.image=[UIImage imageNamed:@"mine_default"];
    MineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mine_select"];
    MyNavigationController *MineNC = [[MyNavigationController alloc]initWithRootViewController:MineVC];
    
    self.viewControllers=@[HomeNV,AssessNC,CourseNC,ForumNC,MineNC];
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
