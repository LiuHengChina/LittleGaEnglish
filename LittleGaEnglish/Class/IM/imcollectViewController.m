//
//  imcollectViewController.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "imcollectViewController.h"
#import "PieceWise.h"
#import "xiaoxiliebiao.h"
#import "tongzhi.h"
@interface imcollectViewController ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation imcollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.title = @"我的消息";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSArray *controllers = @[];
    xiaoxiliebiao *replydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"xiaoxiliebiao"];
    replydetail.title = @"聊天消息";
    
    
    tongzhi *myreplydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"tongzhi"];
    myreplydetail.title = @"系统消息";
    controllers = [controllers arrayByAddingObject:replydetail];
    controllers = [controllers arrayByAddingObject:myreplydetail];
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
    if ([segue.identifier isEqualToString:@"1111111111"]) {
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
