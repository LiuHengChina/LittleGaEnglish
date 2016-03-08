//
//  mycollection.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "mycollection.h"
#import "PieceWise.h"
#import "CollectionDelete.h"
@interface mycollection ()
@property (nonatomic,weak) THSegmentedPager * tabControl;

@end

@implementation mycollection

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSArray *controllers = @[];
    CollectionDelete *replydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionDelete"];
    replydetail.title = @"课程";
//    Replymypost *myreplydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"Replymypost"];
//    myreplydetail.title = @"我回复的";
    controllers = [controllers arrayByAddingObject:replydetail];
//    controllers = [controllers arrayByAddingObject:myreplydetail];
    [self.tabControl setPages:[controllers mutableCopy]];
    [self.tabControl updateTitleLabels];
    [self.tabControl setSelectedPageIndex:0 animated:NO];
    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"collection"]) {
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
