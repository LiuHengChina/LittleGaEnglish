//
//  MineViewController.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/4.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MineViewController.h"
#import "MineDetails.h"

@interface MineViewController ()
@property (strong, nonatomic) IBOutlet UILabel *levelLB;
@property (strong, nonatomic) IBOutlet UIView *courseLB;
@property (strong, nonatomic) IBOutlet UIView *postLB;
@property (strong, nonatomic) IBOutlet UIView *collectionLB;
@property (strong, nonatomic) IBOutlet UIView *fanLB;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leveLBwidht;


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
        default:
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
}

#pragma mark - Table view data source




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
