//
//  collpost.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/8.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "collpost.h"

@interface collpostcell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *shanchuimage;

@end

@implementation collpostcell

@end

@interface collpost ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;

@end

@implementation collpost

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arraylist = [NSMutableArray arrayWithCapacity:0];
    self.viewhiden.hidden = YES;
    self.widht.constant = self.view.frame.size.width/2;
    self.collection.allowsMultipleSelection = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collpostcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collpostcell" forIndexPath:indexPath];
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 260);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    collpostcell *cell = (collpostcell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row inSection:indexPath.section]];
    cell.shanchuimage.image = [UIImage imageNamed:@"yesselection"];
    [self.arraylist addObject:@(indexPath.row)];
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    collpostcell *cell = (collpostcell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row inSection:indexPath.section]];
    cell.shanchuimage.image = [UIImage imageNamed:@"selection"];
    [self.arraylist removeObject:@(indexPath.row)];
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
