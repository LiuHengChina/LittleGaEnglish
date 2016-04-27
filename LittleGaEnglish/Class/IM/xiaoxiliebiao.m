//
//  xiaoxiliebiao.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "xiaoxiliebiao.h"


@interface xiaoxiliebiaocell : UITableViewCell

@end

@implementation xiaoxiliebiaocell


@end

@interface xiaoxiliebiao ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tabview;

@end

@implementation xiaoxiliebiao

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
    xiaoxiliebiaocell *CELL = [tableView dequeueReusableCellWithIdentifier:@"xiaoxiliebiaocell" forIndexPath:indexPath];
    
    return CELL;
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
