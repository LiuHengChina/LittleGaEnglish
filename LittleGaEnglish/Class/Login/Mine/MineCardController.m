//
//  MineCardController.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/31.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MineCardController.h"
#import "UIViewController+WDNavResponderAction.h"
#import "Masonry.h"
@interface MineCardController ()
@property (nonatomic ,strong)UISwitch *allMan;
@property (nonatomic ,strong)UISwitch *myFriend;
@property (nonatomic ,strong)UISwitch *none;
@end

@implementation MineCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化界面
     [self initializeFace];
}
- (void)initializeFace{
    self.view.backgroundColor = RGBA(250, 250, 250, 1);
    self.title = @"帖子记录设置";
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryNone;

    if (indexPath.row == 0) {
       cell.textLabel.attributedText = [self stringOfTableList:@"所有人"];
        //添加选择按钮
        _allMan = [[UISwitch alloc] init];
        [cell.contentView addSubview:_allMan];
        [_allMan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView);
            make.right.equalTo(cell.mas_right).offset(-22.5);
        }];
        //添加按钮事件
        [_allMan addTarget:self action:@selector(allMan:) forControlEvents: UIControlEventValueChanged];
    }else if(indexPath.row == 1){
       cell.textLabel.attributedText = [self stringOfTableList:@"我的好友"];
        //添加选择按钮
        _myFriend = [[UISwitch alloc] init];
        [cell.contentView addSubview:_myFriend];
        [_myFriend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView);
            make.right.equalTo(cell.mas_right).offset(-22.5);
        }];
        //添加按钮事件
        [_myFriend addTarget:self action:@selector(myFriend:) forControlEvents: UIControlEventValueChanged];
    }else{
       cell.textLabel.attributedText = [self stringOfTableList:@"所有人都不可以看"];
        //添加选择按钮
        _none = [[UISwitch alloc] init];
        [cell.contentView addSubview:_none];
        [_none mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView);
            make.right.equalTo(cell.mas_right).offset(-22.5);
        }];
        [_none addTarget:self action:@selector(none:)  forControlEvents:UIControlEventValueChanged];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
//设置section Head 头部标签
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
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
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"设置谁可以看我发的帖子"attributes:attrs];
    
    lable.attributedText =str;
    return head;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

#pragma 设置谁可以看我的发帖事件
- (void)allMan:(UISwitch *)sender{
    if(sender.on == YES){}
    if (_none.on ==YES) {
        [_none setOn:NO animated:YES];
        [_myFriend setOn:NO animated:YES];
    }
}
- (void)myFriend:(UISwitch *)sender{
    if (sender.on == YES) {
        [_allMan setOn:NO animated:YES];
        [_none setOn:NO animated:YES];
    }
}
- (void)none:(UISwitch *)sender{
    if (sender.on == YES) {
        [_myFriend setOn:NO animated:YES];
        [_allMan setOn:NO animated:YES];
    }
}
//设置属性字符创,(有待封装:扩展一下)
- (NSAttributedString *)stringOfTableList:(NSString *)string{
    NSDictionary* attrs =@{
                           NSFontAttributeName:[UIFont systemFontOfSize:12],//文本的颜色 字体 大小
                           NSForegroundColorAttributeName:RGBA(51, 51, 51, 1)//文字颜色
                           };
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    return str;
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
