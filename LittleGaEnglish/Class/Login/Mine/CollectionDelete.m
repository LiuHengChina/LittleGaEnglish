//
//  CollectionDelete.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CollectionDelete.h"

@interface CollectionDeleteCell : UITableViewCell

@end
@implementation CollectionDeleteCell

@end

@interface CollectionDelete ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CollectionDelete

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDeleteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CollectionDeleteCell" forIndexPath:indexPath];
    
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
