
//
//  ClassRecommended.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ClassRecommended.h"

@interface ClassRecommendedCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cover;

@end

@implementation ClassRecommendedCell

@end
@interface ClassRecommended ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation ClassRecommended

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ClassRecommendedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassRecommendedCell" forIndexPath:indexPath];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-50)/4, 59);
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
