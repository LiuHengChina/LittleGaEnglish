//
//  CollectionDelete.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CollectionDelete.h"
#import "mycollection.h"
@interface CollectionDeleteCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *shanchuimage;

@end
@implementation CollectionDeleteCell

@end

@interface CollectionDelete ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttoneqwidht;
@end

@implementation CollectionDelete

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arraylist = [NSMutableArray arrayWithCapacity:0];
    self.viewhiden.hidden = YES;
    self.navigationItem.title = @"我的";
    self.buttoneqwidht.constant = self.view.frame.size.width/2;
    self.tableview.tableFooterView = [UIView new];
    // Do any additional setup after loading the view.
    self.tableview.allowsMultipleSelection = YES;
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
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDeleteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionDeleteCell" forIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDeleteCell *cell = (CollectionDeleteCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.shanchuimage.image = [UIImage imageNamed:@"yesselection"];
    [self.arraylist addObject:@(indexPath.row)];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDeleteCell *cell = (CollectionDeleteCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.shanchuimage.image = [UIImage imageNamed:@"selection"];
    [self.arraylist addObject:@(indexPath.row)];
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
