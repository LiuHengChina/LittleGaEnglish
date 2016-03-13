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
#import "ReactiveCocoa.h"
@interface mycollection ()
@property (nonatomic,weak) THSegmentedPager * tabControl;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hight;

@end

@implementation mycollection

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的收藏";

    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSArray *controllers = @[];
    CollectionDelete *replydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"CollectionDelete"];
    replydetail.title = @"课程";

    
    collpost *myreplydetail = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"collpost"];
    myreplydetail.title = @"帖子";

    
    goodscontro *goodcon = [[UIStoryboard storyboardWithName:@"MineViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"goodscontro"];
    goodcon.title = @"商品";

    controllers = [controllers arrayByAddingObject:replydetail];
    controllers = [controllers arrayByAddingObject:myreplydetail];
    controllers = [controllers arrayByAddingObject:goodcon];

    [self.tabControl setPages:[controllers mutableCopy]];
    [self.tabControl updateTitleLabels];
    [self.tabControl setSelectedPageIndex:0 animated:NO];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:replydetail action:@selector(deletecontro)];
    RACSignal *replydetailsignal = [replydetail rac_signalForSelector:@selector(viewWillAppear:)];
    [replydetailsignal subscribeNext:^(id x) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:replydetail action:@selector(deletecontro)];;
    }];


    
    
    RACSignal *myreplydetailsignal = [myreplydetail rac_signalForSelector:@selector(viewWillAppear:)];
    [myreplydetailsignal subscribeNext:^(id x) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:myreplydetail action:@selector(deletecontro)];;
    }];

    
    
    
    
    
    RACSignal *goodscontrosignal = [goodcon rac_signalForSelector:@selector(viewWillAppear:)];
    [goodscontrosignal subscribeNext:^(id x) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:goodcon action:@selector(deletecontro)];;
    }];


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
@implementation goodscontro (goodscontro)
-(void)deletecontro
{
    NSLog(@"dss%@",self.arraylist);
    if (self.viewhiden.hidden) {
        self.viewhiden.hidden = NO;
        NSLog(@"dssss%@",self.arraylist);
    }else {
        self.viewhiden.hidden = YES;
    }
}
@end
@implementation CollectionDelete (CollectionDelete)
-(void)deletecontro
{
    if (self.viewhiden.hidden) {
        self.viewhiden.hidden = NO;
        NSLog(@"dssss%@",self.arraylist);
    }else {
        self.viewhiden.hidden = YES;
    }
}
@end
@implementation collpost (collpost)
-(void)deletecontro
{
    if (self.viewhiden.hidden) {
        self.viewhiden.hidden = NO;
        NSLog(@"dssss%@",self.arraylist);
    }else {
        self.viewhiden.hidden = YES;
    }
    NSLog(@"dss%@",self.arraylist);
}
@end