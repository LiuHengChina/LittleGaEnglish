//
//  quanbu.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/17.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "quanbu.h"
#import "ReactiveCocoa.h"
#import "weibaxiangqing.h"
#import "dakaxiangqing.h"
#import "LunTanListModel.h"
#import "MyApiLunTan.h"

@interface quanbucell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;
@end

@implementation quanbucell

@end


@interface quanbuheader : UICollectionReusableView

@end

@implementation quanbuheader

- (IBAction)zuiixnhuifu:(id)sender {
    
    
}

- (IBAction)zuixinfatie:(id)sender {
    
}


@end

@interface quanbu ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collect;
@property (nonatomic, strong) LunTanListModel *model;
@end

@implementation quanbu

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(self.model != nil){
        return self.model.list.count;
    } else {
        return 0;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    quanbucell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"quanbucell" forIndexPath:indexPath];
    cell.widht.constant = self.view.frame.size.width/3;
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    quanbuheader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"quanbuheader" forIndexPath:indexPath];
    
    RACSignal *zuixinhuifu = [header rac_signalForSelector:@selector(zuiixnhuifu:)];
    [zuixinhuifu subscribeNext:^(id x) {
        NSLog(@"最新回复");
    }];
    RACSignal *zuixinfatie = [header rac_signalForSelector:@selector(zuixinfatie:)];
    [zuixinfatie subscribeNext:^(id x) {
        NSLog(@"最新时间");
    }];
    return header;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 243);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2 == 0) {
        [self performSegueWithIdentifier:@"quanbuweiba" sender:@(999999)];
    } else {
        [self performSegueWithIdentifier:@"quanbudaka" sender:self];
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"quanbuweiba"]) {
        [(weibaxiangqing *)segue.destinationViewController setIdd:[sender integerValue]];
    }
}

- (void)getData{
    [[MyApiLunTan share] getThreadListDataID:nil digest:NO order:@"1" page:@"1" Success:^(MyApiLunTan *request, LunTanListModel *model) {
        self.model = model;
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
