//
//  ReplyDetail.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ReplyDetail.h"

@interface ReplyDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *timeLB;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;

@end
@implementation ReplyDetailCell

@end
@interface ReplyDetail ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ReplyDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.tableFooterView = [UIView new];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)viewControllerTitle
{
    return self.title;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReplyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReplyDetailCell" forIndexPath:indexPath];
    
    return cell;
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
