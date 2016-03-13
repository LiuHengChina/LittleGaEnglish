//
//  wodefensi.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/9.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "wodefensi.h"
#import "UIColor+Category.h"

@interface wodefensicell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cover;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;
@property (strong, nonatomic) IBOutlet UILabel *state;

@end
@implementation wodefensicell
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.state.layer.borderColor = [UIColor customColorWithString:@"ff6600"].CGColor;
}

@end

@interface wodefensi ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation wodefensi

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
    return 15;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    wodefensicell *cell = [tableView dequeueReusableCellWithIdentifier:@"wodefensicell" forIndexPath:indexPath];
    
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
