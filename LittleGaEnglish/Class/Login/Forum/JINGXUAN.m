//
//  JINGXUAN.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/17.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "JINGXUAN.h"
#import "ReactiveCocoa.h"
#import "gengduoweibo.h"
#import "remenhuati.h"
@interface rementiezicell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;

@end
@implementation rementiezicell

@end

@interface headercollect : UICollectionReusableView

@end

@implementation headercollect


@end
@interface JINGXUAN ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collcetion;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hight;

@end

@implementation JINGXUAN

- (void)viewDidLoad {
    [super viewDidLoad];
    [RACObserve(self, collcetion.contentSize) subscribeNext:^(id x) {
        self.hight.constant = self.collcetion.contentSize.height + 355;
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    rementiezicell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rementiezicell" forIndexPath:indexPath];
    cell.widht.constant = self.view.frame.size.width/3;
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 243);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    headercollect *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headercollect" forIndexPath:indexPath];
    
    return headerView;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"huati"]) {
        [(remenhuati *)segue.destinationViewController setStr:@"传值示范"];
    } else if ([segue.identifier isEqualToString:@"weiba"]){
        
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
