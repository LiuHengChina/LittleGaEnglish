//
//  SystenController.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/30.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "SystenController.h"
#import "Masonry.h"

@interface SystenController ()<UITableViewDataSource>
@property (nonatomic ,strong)NSArray *tableData;
@end
@implementation SystenController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.view.backgroundColor = RGBA(250, 250, 250, 1);
    _tableData = @[@"清理课程缓存",@"设置发帖记录查看",@"去应用商店好评",@"关于小咖"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    NSAttributedString *str;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
        str = [self stringOfTableList:@"清理课程缓存"];
        }else{
        str = [self stringOfTableList:@"设置发帖记录查看"];
        }
        cell.textLabel.attributedText = str;
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            str = [self stringOfTableList:@"去应用商店好评"];
        }else{
            str = [self stringOfTableList:@"关于小咖英语"];
        }
        cell.textLabel.attributedText = str;
    }
   
    
    return cell;
}

- (NSAttributedString *)stringOfTableList:(NSString *)string{
    NSDictionary* attrs =@{
                           NSFontAttributeName:[UIFont systemFontOfSize:12],//文本的颜色 字体 大小
                           NSForegroundColorAttributeName:RGBA(51, 51, 51, 1)//文字颜色
                           };
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    return str;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 87.5;
    }else{
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   
    if (section == 1) {
        UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 87.5)];
        UIButton *quitBtn = [[UIButton alloc] init];
        quitBtn.layer.cornerRadius = 5;
        quitBtn.backgroundColor = RGBA(54, 171, 241, 1);
        [foot addSubview:quitBtn];
        [quitBtn setTintColor:[UIColor whiteColor]];
        [quitBtn setTitle:@"退出登陆" forState: UIControlStateNormal];
        [quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(foot.mas_top).offset(43);
            make.height.equalTo(@44.5);
            make.width.equalTo(@315);
            make.centerX.equalTo(foot);
        }];
        return foot;
    }else{
        return nil;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    return head;
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
