//
//  fan1.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/9.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "fan1.h"
#import "PieceWise.h"
#import "wodehaoyou.h"
#import "wodefensi.h"
#import "woguanzhude.h"
@interface fan1 ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation fan1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的粉丝";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSArray *controllers = @[];
    wodehaoyou *replydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"wodehaoyou"];
    replydetail.title = @"我的好友";
    
    wodefensi *wodefensi = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"wodefensi"];
    wodefensi.title = @"我的粉丝";
    
    woguanzhude *woguanzhude = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"woguanzhude"];
    woguanzhude.title = @"我的粉丝";
    
    controllers = [controllers arrayByAddingObject:replydetail];
    controllers = [controllers arrayByAddingObject:wodefensi];
    controllers = [controllers arrayByAddingObject:woguanzhude];

    [self.tabControl setPages:[controllers mutableCopy]];
    [self.tabControl updateTitleLabels];
    [self.tabControl setSelectedPageIndex:0 animated:NO];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"fan2"]) {
        self.tabControl = segue.destinationViewController;
    }
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
