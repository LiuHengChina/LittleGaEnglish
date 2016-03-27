//
//  ForumViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ForumViewController.h"
#import "PieceWise.h"
#import "JINGXUAN.h"
#import "quanbu.h"
#import "fabu.h"
@interface ForumViewController ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation ForumViewController


- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"论坛";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    NSArray *controllers = @[];
    
    JINGXUAN *woguanzhude = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"JINGXUAN"];
    woguanzhude.title = @"精选";

    quanbu *quanbuview = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"quanbu"];
    quanbuview.title = @"全部";
    
    controllers = [controllers arrayByAddingObject:woguanzhude];
    controllers = [controllers arrayByAddingObject:quanbuview];

    [self.tabControl setPages:[controllers mutableCopy]];
    [self.tabControl updateTitleLabels];
    [self.tabControl setSelectedPageIndex:0 animated:NO];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"luntanyou"] style:UIBarButtonItemStylePlain target:self action:@selector(youfangfa:)];
    // Do any additional setup after loading the view.
}
-(void)youfangfa:(UIBarButtonItem *)sender
{
    fabu *fa = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"fabu"];
    [self.navigationController pushViewController:fa animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"luntanjingxuan"]) {
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
