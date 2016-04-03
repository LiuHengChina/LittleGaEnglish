//
//  remenhuati.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "remenhuati.h"
#import "huati.h"
@interface remenhuaticell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation remenhuaticell
-(void)awakeFromNib
{
    [super awakeFromNib];
}
+(CGFloat) wightForContent:(NSString *) class fixSize:(CGSize) size{
    CGSize maxSize = CGSizeMake(MAXFLOAT,30);
    NSAttributedString *content = [[NSAttributedString alloc] initWithString:class
                                                                  attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.]}];
    CGRect contentBoundingRect = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context: nil];
    return MAX(20, contentBoundingRect.size.width + 20);
}
@end

@interface remenhuati ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;

@end

@implementation remenhuati

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)gengduohuati:(id)sender {
    NSLog(@"更多话题");
    huati *hua = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"huati"];
    [self.navigationController pushViewController:hua animated:YES];
    
}

- (void)setDataArr:(NSMutableArray<HotTopicModel *> *)dataArr
{
    _dataArr = dataArr;
    [self.collection reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.dataArr != nil) {
        return self.dataArr.count;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    remenhuaticell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"remenhuaticell" forIndexPath:indexPath];
    cell.label.text = self.dataArr[indexPath.row].topic_name;
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake([remenhuaticell wightForContent:@"#数据#" fixSize:self.collection.frame.size], 45);
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
