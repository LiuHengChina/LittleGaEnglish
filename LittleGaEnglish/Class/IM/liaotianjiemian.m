//
//  liaotianjiemian.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "liaotianjiemian.h"
#import "reactlabel.h"

@interface liaotianjiezuo : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imagecover;
@property (strong, nonatomic) IBOutlet reactlabel *lablezuo;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *wight;

@end
@implementation liaotianjiezuo

+(CGFloat)tableheightForContent:(NSString*) comment fixSize:(CGSize) size{
    CGSize maxSize = CGSizeMake(size.width - 170, MAXFLOAT);
    NSAttributedString *content = [[NSAttributedString alloc] initWithString:comment attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.]}];
    CGRect contentBoundingRect = [content boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context: nil];
    return contentBoundingRect.size.height+60;
}
+(CGFloat)tablewideForContent:(NSString*) comment fixSize:(CGSize) size{
    CGSize maxSize = CGSizeMake(MAXFLOAT,32);
    NSAttributedString *content = [[NSAttributedString alloc] initWithString:comment attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.]}];
    CGRect contentBoundingRect = [content boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context: nil];
    NSLog(@"%f",contentBoundingRect.size.width);
    return contentBoundingRect.size.width + 16;
}
@end

@interface liaotianjieyou : UITableViewCell
@property (strong, nonatomic) IBOutlet reactlabel *labelyou;
@property (strong, nonatomic) IBOutlet UIImageView *coveryou;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *wight;

@end

@implementation liaotianjieyou


@end

@interface liaotianjiemian ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation liaotianjiemian

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
    if (indexPath.row == 2) {
        liaotianjieyou *cell = [tableView dequeueReusableCellWithIdentifier:@"liaotianjieyou" forIndexPath:indexPath];
        cell.labelyou.text = @"dsddsdsdsdsdds";
        cell.wight.constant = [self cellwightcellstr:cell.labelyou.text];
        return cell;
    }
    liaotianjiezuo *cell = [tableView dequeueReusableCellWithIdentifier:@"liaotianjiezuo" forIndexPath:indexPath];
    cell.lablezuo.text = @"dsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsds";
    cell.wight.constant = [self cellwightcellstr:cell.lablezuo.text];
    return cell;
}
-(CGFloat)cellwightcellstr:(NSString *)text
{
    CGFloat wight = self.tableview.frame.size.width - 162;
    CGFloat flolt = [liaotianjiezuo tablewideForContent:text fixSize:self.tableview.frame.size];
    if (wight > flolt) {
        return flolt;
    } else {
        return wight;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return [liaotianjiezuo tableheightForContent:@"dsddsdsdsdsdds" fixSize:self.tableview.frame.size];
    }
    return [liaotianjiezuo tableheightForContent:@"dsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsdsdsddsdsds" fixSize:self.tableview.frame.size];
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
