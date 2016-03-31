//
//  ShopeController.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/29.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ShopeController.h"
#import "ShopCell.h"
#import "CSAdPageView.h"
#import "Masonry.h"
@interface ShopeController ()<UICollectionViewDataSource,UICollectionViewDelegate,CSAdPageViewDelegate>
@property (nonatomic ,strong)UICollectionView *shopCollection;
//@property (nonatomic ,strong)UIScrollView *headView;
@property (nonatomic ,strong)CSAdPageView *headView;

@end

@implementation ShopeController
- (void)viewWillAppear:(BOOL)animated{
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //界面
    [self initializeFace];
}

- (void)initializeFace{
    //添加Collection列表视图
    [self addHeadImage];
    //添加Collection列表视图
    [self addShopCollection];

}
//添加Collection列表视图
- (void)addHeadImage{
    self.view.backgroundColor = [UIColor whiteColor];
//    _headView = [[UIScrollView alloc] init];
//    _headView.contentSize = CGSizeMake(100, 100);
//    [self.view addSubview:_headView];
    _headView = [[CSAdPageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 165)];
    _headView.delegate = self;
//    [_headView addSubview:_head];
    [self.view addSubview:_headView];
    _headView.backgroundColor = [UIColor yellowColor];
    
    UIImage *image1 = [UIImage imageNamed:@"图层-2"];
    NSArray *adItemArr = @[@""];

    [adItemArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
       
    }];
    [_headView setAds:adItemArr];
    
    
   
}
- (void)didSelectPageViewIndex:(NSInteger)index{
    
  
}
//添加Collection列表视图
- (void)addShopCollection{

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    UICollectionView *shopCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    shopCollection.backgroundColor = [UIColor whiteColor];
    //注册
    UINib *ShopeNib = [UINib nibWithNibName:@"ShopCell"
                                     bundle: [NSBundle mainBundle]];
    [shopCollection registerNib:ShopeNib forCellWithReuseIdentifier:@"Shope"];
    UINib *ShopeListnib = [UINib nibWithNibName:@"ShopListCell"
                                         bundle: [NSBundle mainBundle]];
    [shopCollection registerNib:ShopeListnib forCellWithReuseIdentifier:@"List"];
    
    shopCollection.delegate = self;
    shopCollection.dataSource = self;
    
    [self.view addSubview:shopCollection];
    WS(weakS);
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakS.view);
        make.height.equalTo(@165);
    }];
   
    [shopCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headView.mas_bottom);
        make.bottom.left.right.equalTo(weakS.view);
    }];
    _shopCollection = shopCollection;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 10;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

        static NSString *indenfierCell = @"Shope";
        ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indenfierCell forIndexPath:indexPath];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopCell" owner:self options:nil]lastObject];
        }
       //测试图片
        cell.imageV.image = [UIImage imageNamed:@"图层-2"];
        
        return cell;
   
   
}
//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {0 ,10,10,10};
    return top;
}

//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={10,10};
    return size;
}
//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%f",(kDeviceHeight-88-49)/4.0);
    return CGSizeMake((self.view.frame.size.width-30)/2,81.5+27);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
