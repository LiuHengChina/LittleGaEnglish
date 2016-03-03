//
//  CoursesViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoursesViewController.h"
#import "BBCourseBobyViewController.h"
#import "APIUrl.h"

@interface CoursesViewController ()<FJSlidingControllerDataSource,FJSlidingControllerDelegate>

@property (nonatomic, strong)NSArray *titles;
@property (nonatomic, strong)NSArray *controllers;

@end

@implementation CoursesViewController


- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程";
    
    self.datasouce = self;
    self.delegate = self;
    
    BBCourseBobyViewController  *VC1 = [BBCourseBobyViewController new];
    VC1.url = k_url_openClass;
    VC1.VC = self;
    
    BBCourseBobyViewController *VC2 = [BBCourseBobyViewController new];
    VC2.url = k_url_College;
    VC2.VC = self;

    
    self.titles = @[@"小咖公开课",@"小咖学院"];
    self.controllers = @[VC1,VC2];
    [self addChildViewController:VC1];
    [self addChildViewController:VC2];
    
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark dataSouce
- (NSInteger)numberOfPageInFJSlidingController:(FJSlidingController *)fjSlidingController{
    return self.titles.count;
}
- (UIViewController *)fjSlidingController:(FJSlidingController *)fjSlidingController controllerAtIndex:(NSInteger)index{
    return self.controllers[index];
}
- (NSString *)fjSlidingController:(FJSlidingController *)fjSlidingController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}

@end
