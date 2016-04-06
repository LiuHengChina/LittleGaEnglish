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
#import "MyApiLunTan.h"
#import "weibaxiangqing.h"

@interface rementiezicell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;
@property (nonatomic, strong) HotThreadModel *model;
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UIButton *dianzanLab;

@property (strong, nonatomic) IBOutlet UIButton *shoucangLab;
@property (strong, nonatomic) IBOutlet UIButton *pinglunLab;

@property (strong, nonatomic) IBOutlet UILabel *titleLab;
@end
@implementation rementiezicell


- (void)setModel:(HotThreadModel *)model
{
    _model = model;
    [_myImage sd_setImageWithURL:[NSURL URLWithString:model.imgurl] placeholderImage:nil completed:nil];
    [_dianzanLab setTitle:model.praise forState:UIControlStateNormal];
    [_shoucangLab setTitle:model.favorite forState:UIControlStateNormal];
    [_pinglunLab setTitle:model.reply_count forState:UIControlStateNormal];
    _titleLab.text = model.title;
}

@end


@interface headercollect : UICollectionReusableView

@end

@implementation headercollect

@end

@interface JINGXUAN ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collcetion;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *hight;

@property (strong, nonatomic) IBOutlet UILabel *tileLabel;
@property (strong, nonatomic) IBOutlet UILabel *weekLab;
@property (strong, nonatomic) IBOutlet UIButton *signBtn;
@property (strong, nonatomic) IBOutlet UILabel *signCountLab;

@property (nonatomic, strong) remenhuati *remenhuatiVC;
@property (nonatomic, strong) gengduoweibo *gengduoweibaVC;

@property (nonatomic, strong) NSMutableArray<HotThreadModel *> *dataArr;
@property (nonatomic, strong) singModel *mySignModel;

@end

@implementation JINGXUAN

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RACObserve(self, collcetion.contentSize) subscribeNext:^(id x) {
        self.hight.constant = self.collcetion.contentSize.height + 355;
    }];
    [self getData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tileLabel.text = [NSString getDateNow];
    self.weekLab.text = [NSString getWeekNow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    rementiezicell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rementiezicell" forIndexPath:indexPath];
    cell.widht.constant = self.view.frame.size.width/3;
    cell.model = self.dataArr[indexPath.row];
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    weibaxiangqing *huatiVC = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil]instantiateViewControllerWithIdentifier:@"weibaxiangqing"];
    huatiVC.thread_id = self.dataArr[indexPath.row].post_id;
    [self.navigationController pushViewController:huatiVC animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"huati"]) {
        self.remenhuatiVC = (remenhuati *)segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"weiba"]){
        self.gengduoweibaVC = (gengduoweibo *)segue.destinationViewController;
    }
}
- (IBAction)signBtnAction:(id)sender {
    UIButton *button = sender;
    NSString *str = button.currentTitle;
    if ([str isEqualToString:@"签到成功"]) {
        return;
    }
    
    [[MyApiLunTan share]singSuccess:^(MyApiLunTan *request, NSString *signDate) {
        [self.signBtn setTitle:@"签到成功" forState:UIControlStateNormal];
        self.signCountLab.text = [NSString stringWithFormat:@"已经连续签到%@天", signDate];
    } Failure:^(MyApiLunTan *request, NSError *requestError) {
        [WDTipsView showTipsViewWithString:requestError.domain];
    }];
}

- (void)setMySignModel:(singModel *)mySignModel
{
    _mySignModel = mySignModel;
    if (mySignModel.isSign) {
        [self.signBtn setTitle:@"签到成功" forState:UIControlStateNormal];
        self.signBtn.enabled = YES;
    } else{
        [self.signBtn setTitle:@"今日签到" forState:UIControlStateNormal];
    }
    self.signCountLab.text = [NSString stringWithFormat:@"已经连续签到%@天", mySignModel.lxSignDay];
}


- (void)getData
{
    [[MyApiLunTan share]getBBSIndexDataSuccess:^(MyApiLunTan *request, LunTanMainModel *model) {
        self.dataArr = model.hotThread;
        self.mySignModel = model.signArr;
        self.remenhuatiVC.dataArr = model.hotTopic;
        self.gengduoweibaVC.dataArr = model.hotWeiba;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collcetion reloadData];
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
