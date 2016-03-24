//
//  fabu.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "fabu.h"
#import "PieceWise.h"
#import "fabutiezi.h"
#import "fabuhuati.h"

@interface fabu ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation fabu

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *controllers = @[];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    fabutiezi *woguanzhude = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"fabutiezi"];
    woguanzhude.title = @"帖子";
    
    fabuhuati *quanbuview = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"quanbu"];
    quanbuview.title = @"话题";
    
    controllers = [controllers arrayByAddingObject:woguanzhude];
    controllers = [controllers arrayByAddingObject:quanbuview];
    
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
    if ([segue.identifier isEqualToString:@"fabuneirong"]) {
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
