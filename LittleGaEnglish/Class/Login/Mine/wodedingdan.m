//
//  wodedingdan.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/9.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "wodedingdan.h"
#import "PieceWise.h"
#import "kecheng.h"
#import "shangpin.h"
@interface wodedingdan ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation wodedingdan

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    NSArray *controllers = @[];
    kecheng *replydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"kecheng"];
    replydetail.title = @"课程";
    
    shangpin *wodefensi = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"shangpin"];
    wodefensi.title = @"商品";
//
//    woguanzhude *woguanzhude = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"woguanzhude"];
//    woguanzhude.title = @"我的粉丝";
    
    controllers = [controllers arrayByAddingObject:replydetail];
    controllers = [controllers arrayByAddingObject:wodefensi];
//    controllers = [controllers arrayByAddingObject:woguanzhude];
    
    [self.tabControl setPages:[controllers mutableCopy]];
    [self.tabControl updateTitleLabels];
    [self.tabControl setSelectedPageIndex:0 animated:NO];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"orders"]) {
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
