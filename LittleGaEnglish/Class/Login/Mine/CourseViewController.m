//
//  CourseViewController.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CourseViewController.h"
#import "PieceWise.h"
#import "CourseViewDetail.h"
#import "CompleteViewController.h"
@interface CourseViewController ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSArray *controllers = @[];
    CourseViewDetail *courseViewDetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"CourseViewDetail"];
    courseViewDetail.title = @"学习中";
    CompleteViewController *completeviewcontroller = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"CompleteViewController"];
    completeviewcontroller.title = @"已完成";
    controllers = [controllers arrayByAddingObject:courseViewDetail];
    controllers = [controllers arrayByAddingObject:completeviewcontroller];
    [self.tabControl setPages:[controllers mutableCopy]];
    [self.tabControl updateTitleLabels];
    [self.tabControl setSelectedPageIndex:0 animated:NO];
    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"artist"]) {
        self.tabControl = segue.destinationViewController;
    }
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
