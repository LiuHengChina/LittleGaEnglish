//
//  CourseViewDetail.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CourseViewDetail.h"

@interface CourseViewDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *covew;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;
@property (strong, nonatomic) IBOutlet UILabel *progess;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *percentage;
@property (assign, nonatomic) float progessnumber;
@end
@implementation CourseViewDetailCell
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.progess.layer.borderColor = [UIColor colorWithRed:0.0f/255.0f green:160.0f/255.0f blue:233.0f/255.0f alpha:1].CGColor;
    NSLog(@"%f %f",self.progess.frame.size.width,self.progessnumber);
}
@end

@interface CourseViewDetail ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation CourseViewDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseViewDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseViewDetailCell" forIndexPath:indexPath];
    cell.percentage.constant = cell.progess.frame.size.width * 0.5;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)viewControllerTitle
{
    return self.title;
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
