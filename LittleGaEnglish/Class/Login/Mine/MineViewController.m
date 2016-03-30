//
//  MineViewController.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MineViewController.h"
#import "MineDetails.h"
#import "MyApiMine.h"
#import "ScoredController.h"
#import "FindController.h"
#import "SystenController.h"

@interface MineViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *nameLab;
@property (strong, nonatomic) IBOutlet UILabel *vipLab;

@property (strong, nonatomic) IBOutlet UILabel *levelLB;
@property (strong, nonatomic) IBOutlet UILabel *courseLB;
@property (strong, nonatomic) IBOutlet UILabel *postLB;
@property (strong, nonatomic) IBOutlet UILabel *collectionLB;
@property (strong, nonatomic) IBOutlet UILabel *fanLB;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leveLBwidht;
@property (nonatomic, strong) MineModel *model;

@end
@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.title = @"我的";
    self.levelLB.layer.borderColor = [UIColor colorWithRed:73.0f/255.0f green:182.0f/255.0f blue:0 alpha:.5f].CGColor;
    self.leveLBwidht.constant = self.view.frame.size.width/4;
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
    [self getData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"userdata" sender:self];
            break;
        case 1:
            
            break;
        case 3:
            [self performSegueWithIdentifier:@"oeder" sender:self];
            break;
        case 4:
        {
            ScoredController *scored = [[ScoredController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:scored animated:YES];
        }
            break;
        case 5:
        {
            FindController *find = [[FindController alloc]init];
            [self.navigationController pushViewController:find animated:YES];
        }
            break;
        default:
            break;
        case 7:
        {
            SystenController *system = [[SystenController alloc]init];
            [self.navigationController pushViewController:system animated:YES];
        }
            break;
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"userdata"]) {
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)coursetap:(id)sender {
    NSLog(@"课程");
    [self performSegueWithIdentifier:@"courseLB" sender:self];
}
- (IBAction)postLB:(id)sender {
    NSLog(@"帖子");
    [self performSegueWithIdentifier:@"mypost" sender:self];
}
- (IBAction)collectionLB:(id)sender {
    NSLog(@"收藏");
    [self performSegueWithIdentifier:@"collection" sender:self];
}
- (IBAction)fanLB:(id)sender {
    NSLog(@"粉丝");
    [self performSegueWithIdentifier:@"fan" sender:self];
}

#pragma mark - Table view data source

- (void)setModel:(MineModel *)model
{
    _model = model;
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.portrait] placeholderImage:nil completed:nil];
    self.nameLab.text = model.uname;
    if ([model.isVip isEqualToString:@"1"]) {
        self.vipLab.text = @"VIP";
    } else {
        self.vipLab.text = @"";
    }
    
    self.levelLB.text = model.gradeName;
    self.courseLB.text = model.courseNumber;
    self.postLB.text = model.postNumber;
    self.collectionLB.text = model.enshrineNumber;
    self.fanLB.text = model.fansNumber;
    [self.tableView reloadData];
}



- (void)getData
{
    [[MyApiMine share]getMyInfoSuccess:^(MyApiMine *request, MineModel *model) {
        self.model = model;
    } Failure:^(MyApiMine *request, NSError *requestError) {
        [WDTipsView showTipsViewWithString:@"网络错误"];
    }];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
