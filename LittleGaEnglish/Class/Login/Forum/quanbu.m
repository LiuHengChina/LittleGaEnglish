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
@property (nonatomic, strong) HotThreadModel *moedl;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIButton *dianzanLab;
@property (strong, nonatomic) IBOutlet UIButton *shoucangLab;
@property (strong, nonatomic) IBOutlet UIButton *pinglunLab;
@end

@implementation quanbucell


- (void)setMoedl:(HotThreadModel *)moedl
{
    _moedl = moedl;
    [self.image sd_setImageWithURL:[NSURL URLWithString:moedl.imgurl] placeholderImage:nil completed:nil];
    [self.dianzanLab setTitle:moedl.praise forState:UIControlStateNormal];
    [self.shoucangLab setTitle:moedl.favorite forState:UIControlStateNormal];
    [self.pinglunLab setTitle:moedl.reply_count forState:UIControlStateNormal];
}

@end


@interface quanbuheader : UICollectionReusableView

@property (strong, nonatomic) IBOutlet UIButton *huifuBtn;
@property (strong, nonatomic) IBOutlet UIButton *fabuBtn;

@end

@implementation quanbuheader

- (IBAction)zuiixnhuifu:(id)sender {
//    [_fabuBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_huifuBtn setTitleColor:[UIColor customColorWithString:k_Color_navigation] forState:UIControlStateNormal];
}

- (IBAction)zuixinfatie:(id)sender {
//    [_huifuBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [_fabuBtn setTitleColor:[UIColor customColorWithString:k_Color_navigation] forState:UIControlStateNormal];
}


@end

@interface quanbu ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collect;
@property (nonatomic, strong) LunTanListModel *model;
@property (nonatomic, strong) NSString *order;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger upPage;
@property (nonatomic, strong) LunTanListModel *replaceModel;
@property (nonatomic, strong) LunTanListModel *upModel;

@end

@implementation quanbu

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.upPage = 1;
    self.order = @"1";
    
    self.collect.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        _model = nil;
        [self getData];
    }];
    
    self.collect.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self getData];
    }];
    
    [self getData];
    // Do any additional setup after loading the view.
}


- (void)setModel:(LunTanListModel *)model
{
    if(!_model){
        _model = model;
    } else{
        [_model.list addObjectsFromArray:model.list];
    }
}

- (void)setUpModel:(LunTanListModel *)upModel
{
    if(!_upModel){
        _upModel = upModel;
    } else {
        [_upModel.list addObjectsFromArray:upModel.list];
    }
}

- (void)setReplaceModel:(LunTanListModel *)replaceModel
{
    if (!_replaceModel) {
        _replaceModel  = replaceModel;
    } else {
        [_replaceModel.list addObjectsFromArray:replaceModel.list];
    }
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
    cell.moedl = self.model.list[indexPath.row];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    quanbuheader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"quanbuheader" forIndexPath:indexPath];
    
    WS(wself);
    RACSignal *zuixinhuifu = [header rac_signalForSelector:@selector(zuiixnhuifu:)];
    [zuixinhuifu subscribeNext:^(id x) {
        NSLog(@"最新回复");
        _model = nil;
        wself.page = 1;
        wself.order = @"1";
        [wself getData];
    }];
    RACSignal *zuixinfatie = [header rac_signalForSelector:@selector(zuixinfatie:)];
    [zuixinfatie subscribeNext:^(id x) {
        NSLog(@"最新时间");
        _model = nil;
        wself.page = 1;
        wself.order = @"2";
        [wself getData];
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
    [[MyApiLunTan share] getThreadListDataID:self.weiba_id digest:NO order:self.order page:[NSString stringWithFormat:@"%ld",(long)self.page] Success:^(MyApiLunTan *request, LunTanListModel *model) {
        self.model = model;
        if (model.list.count == 0) {
            [self.collect.mj_footer endRefreshingWithNoMoreData];
            return;
        }
        
        [self.collect.mj_footer endRefreshing];
        [self.collect.mj_header endRefreshing];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collect reloadData];
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
