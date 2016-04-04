//
//  huati.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "huati.h"
#import "MyApiLunTan.h"
#import "LunTanMainModel.h"

@interface huaticell : UICollectionViewCell
@property (nonatomic, strong) HotTopicModel *model;
@property (strong, nonatomic) IBOutlet UILabel *title;

@end
@implementation huaticell

- (void)setModel:(HotTopicModel *)model
{
    _model = model;
    self.title.text = [NSString weibaStr:model.topic_name];
}

@end

@interface huati ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray<HotTopicModel *> *datalist;

@end

@implementation huati

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    [self getData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.datalist != nil) {
        return self.datalist.count;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    huaticell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"huaticell" forIndexPath:indexPath];
    cell.model = self.datalist[indexPath.row];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/3, 37.5);
}


- (void)getData
{
    [[MyApiLunTan share]getHuaTiListSuccess:^(MyApiLunTan *request, NSMutableArray *array) {
        self.datalist = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collection reloadData];
        });
    } Failure:^(MyApiLunTan *request, NSError *requestError) {
        [WDTipsView showTipsViewWithString:requestError.domain];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectBlock) {
        self.selectBlock(self.datalist[indexPath.row]);
    }
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
