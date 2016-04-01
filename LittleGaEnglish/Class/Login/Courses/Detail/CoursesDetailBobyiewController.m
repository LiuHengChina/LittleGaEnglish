//
//  CoursesDetailBobyiewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoursesDetailBobyiewController.h"

#import "CoursesDetailDesViewController.h"
#import "CoursesEvalViewController.h"
@interface CoursesDetailBobyiewController ()<FJSlidingControllerDataSource,FJSlidingControllerDelegate>
@property (nonatomic, strong)NSArray *titles;
@property (nonatomic, strong)NSArray *controllers;
@property (nonatomic, strong) CoursesDetailDesViewController *desVC;
@property (nonatomic, strong) CoursesEvalViewController *evalVC;
@end

@implementation CoursesDetailBobyiewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasouce = self;
    self.delegate = self;
    self.titles = @[@"简介",@"评价"];
    self.desVC = [CoursesDetailDesViewController new];
    _desVC.VC = self;
    _desVC.courseID = self.classId;
    self.evalVC = [CoursesEvalViewController new];
    _evalVC.VC = self;
    _evalVC.courseID = self.classId;
    self.controllers = @[_desVC, _evalVC];
    
    [self addChildViewController:_desVC];
    [self addChildViewController:_evalVC];
    
    [self reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setModel:(CourseDetailModel *)model
{
    _model = model;
    _desVC.model = model;
    _evalVC.detailModel = model;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
