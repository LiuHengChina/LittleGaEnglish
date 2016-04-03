//
//  weiba.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "weiba.h"
#import "MyApiLunTan.h"
#import "LunTanMainModel.h"

@interface weibacell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (nonatomic, strong) HotWeibaModel *model;

@end
@implementation weibacell

- (void)setModel:(HotWeibaModel *)model
{
    _model = model;
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.avatar_middle] placeholderImage:[UIImage imageNamed:@"start_1"] completed:nil];
    self.title.text = [NSString weibaStr:model.weiba_name];
}

@end

@interface weiba ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic, strong) NSMutableArray<HotWeibaModel *> *dataArr;
@end

@implementation weiba

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.str);
    self.title = @"全部微吧";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    // Do any additional setup after loading the view.
    [self getData];
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
    weibacell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"weibacell" forIndexPath:indexPath];
    
    cell.model= self.dataArr[indexPath.row];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-40)/3, (self.view.frame.size.width-40)/3);
}


- (void)getData
{
    [[MyApiLunTan share] getWeiBaListSuccess:^(MyApiLunTan *request, NSMutableArray *array) {
       
        self.dataArr = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collection reloadData];
        });
    } Failure:^(MyApiLunTan *request, NSError *requestError) {
        [WDTipsView showTipsViewWithString:requestError.domain];
    }];
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
