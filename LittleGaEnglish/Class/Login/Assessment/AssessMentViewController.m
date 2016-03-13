//
//  AssessMentViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "AssessMentViewController.h"
#import "yuyincepingmain.h"
#import "cewenhuamain.h"
#import "dancipingce.h"
@interface AssessMentView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *yuyin;
@property (strong, nonatomic) IBOutlet UIImageView *danci;
@property (strong, nonatomic) IBOutlet UIImageView *wenhua;

@end
@implementation AssessMentView


@end

@interface AssessMentViewController ()

@end

@implementation AssessMentViewController

- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评测";
    NSArray *assessment = [[NSBundle mainBundle] loadNibNamed:@"assessment" owner:nil options:nil];
    AssessMentView *view = [assessment lastObject];
    view.frame = self.view.frame;
    [self.view addSubview:view];
    
    [view.yuyin addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yuyin:)]];
    [view.danci addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(danci:)]];
    [view.wenhua addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wenhua:)]];

    // Do any additional setup after loading the view.
}
-(void)wenhua:(id)sender
{
    NSLog(@"wenhua");
    cewenhuamain *cewenhua = [cewenhuamain new];
    cewenhua.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cewenhua animated:YES];
}
-(void)danci:(id)sender
{
    NSLog(@"danci");
    dancipingce *danciping = [dancipingce new];
    [self.navigationController pushViewController:danciping animated:YES];
}
-(void)yuyin:(id)sender
{
    yuyincepingmain *yuyin = [yuyincepingmain new];
    [self.navigationController pushViewController:yuyin animated:YES];
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
