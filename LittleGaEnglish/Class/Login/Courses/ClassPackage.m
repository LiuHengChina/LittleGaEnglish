//
//  ClassPackage.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/10.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "ClassPackage.h"
#import "MyUITableView.h"

@interface ClassPackagecollectioncell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *imagecover;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;

@end
@implementation ClassPackagecollectioncell

@end

@interface ClassPackagecell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property (strong, nonatomic) IBOutlet UILabel *taocan;
@property (strong, nonatomic) IBOutlet UILabel *xianjia;
@property (strong, nonatomic) IBOutlet UILabel *yuanjia;
@property (strong, nonatomic) IBOutlet UIButton *lijigoumai;

@end
@implementation ClassPackagecell
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    UINib *cellNib = [UINib nibWithNibName:@"classcellorder" bundle:nil];
    [self.collection registerNib:cellNib forCellWithReuseIdentifier:@"collectioncell"];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"collectioncell";
    ClassPackagecollectioncell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.subtitle.text = @"原价:300.00";
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.frame.size.width-40)/3,51);
}
@end

@interface ClassPackage ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)MyUITableView *tableView;

@end

@implementation ClassPackage
-(void)loadView
{
    self.view = [UIView new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[MyUITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.view = self.tableView;
    
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    self.view.backgroundColor = [UIColor colorWithRed:242.0f/255.0f green:242.0f/255.0f blue:242.0f/255.0f alpha:1];
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Packagecell";
    ClassPackagecell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"ClassPackage" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 179;
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
