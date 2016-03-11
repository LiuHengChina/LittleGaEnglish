//
//  kecheng.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/9.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "kecheng.h"
#import "zhifujiemian.h"
@interface kechengcell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *yizhifu;
@property (strong, nonatomic) IBOutlet UILabel *weizhifu;
@property (strong, nonatomic) IBOutlet UIImageView *cover;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;

@end

@implementation kechengcell

@end

@interface kecheng ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation kecheng

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kechengcell *cell = [tableView dequeueReusableCellWithIdentifier:@"kechengcell" forIndexPath:indexPath];

    (indexPath.row%2 == 0) ? (cell.yizhifu.hidden = YES) : (cell.weizhifu.hidden = YES);
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"quzhifu1" sender:@(211221)];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"quzhifu1"]) {
        [(zhifujiemian *)segue.destinationViewController setOrderid:[sender integerValue]];
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
