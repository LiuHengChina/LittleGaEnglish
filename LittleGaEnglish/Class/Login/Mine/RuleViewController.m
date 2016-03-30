//
//  RuleViewController.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/28.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "RuleViewController.h"
#import "Masonry.h"
#import "ThreeListCell.h"
#import "TwoListCell.h"
#import <UIKit/UIKit.h>
@interface RuleViewController ()
@property (nonatomic ,strong)NSArray *headTitle;
@end

@implementation RuleViewController
- (void)viewWillAppear:(BOOL)animated{
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //界面配置
    [self initializeData];
}
- (void)initializeData{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _headTitle = @[@"咖啡豆获取说明",@"等级说明",@"等级说明",@"常见问题解答"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            static NSString *CellIdentifierThree = @"ThreeCell";
            ThreeListCell *cell = (ThreeListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifierThree];
            
            if(cell==nil){
                cell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeListCell" owner:self options:nil]lastObject];
            }
            
            return cell;
        }
        case 1:
        {
            static NSString *CellIdentifierThree = @"ThreeCell";
            ThreeListCell *cell = (ThreeListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifierThree];
            
            if(cell==nil){
                cell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeListCell" owner:self options:nil]lastObject];
            }
            
            return cell;
        }
            break;
        case 2:
        {
            static NSString *CellIdentifierTwo = @"TwoCell";
            TwoListCell *cell = (TwoListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifierTwo];
            if(cell==nil){
                cell = [[[NSBundle mainBundle]loadNibNamed:@"TwoListCell" owner:self options:nil]lastObject];
            }
            return cell;
        }
        case 3:
        {
            static NSString *CellIdentifierAnwser = @"AnwserCell";
            UITableViewCell *cell = (TwoListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifierAnwser];
            if(cell==nil){
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierAnwser];
            }
            return cell;
        }
        default:
            break;
    }
    

    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 36;
}
//设置section Head 头部标签
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 36)];
    head.backgroundColor = RGBA(250, 250, 250, 1);
    UILabel *lable = [[UILabel alloc] init];
    [head addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(head);
        make.width.equalTo(@150);
        make.left.equalTo(@10);
    }];
    
    NSDictionary* attrs =@{
                           NSFontAttributeName:[UIFont systemFontOfSize:12],//文本的颜色 字体 大小
                           NSForegroundColorAttributeName:RGBA(51, 51, 51, 1)//文字颜色
                                   };
 
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:_headTitle[section] attributes:attrs];

    lable.attributedText =str;
    return head;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 36;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    foot.backgroundColor = [UIColor whiteColor];
    return foot;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
#pragma mark - tableViewDelegate
// 去掉UItableview headerview黏性
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 100;
    if ( (scrollView.contentOffset.y <= sectionHeaderHeight) && (scrollView.contentOffset.y >= 0) )
    {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y >= sectionHeaderHeight)
    {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
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
