//
//  StudentsList.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/10.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "StudentsList.h"
@interface StudentsListcell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cover;
@property (strong, nonatomic) IBOutlet UILabel *title;


@end
@implementation StudentsListcell
-(void)awakeFromNib
{
    [super awakeFromNib];
}
@end
@interface StudentsListcontro : UIView
@property (strong, nonatomic) IBOutlet UICollectionView *collection;

@end
@implementation StudentsListcontro

@end

@interface StudentsList ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) StudentsListcontro *studentsview;
@end

@implementation StudentsList
-(void)loadView
{
    self.view = [UIView new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    self.view.backgroundColor = white;
    
    self.studentsview = [[NSBundle mainBundle] loadNibNamed:@"studentscontro" owner:nil options:nil].firstObject;
    [self.view addSubview:self.studentsview];
    self.studentsview.frame = self.view.bounds;
    self.studentsview.collection.delegate = self;
    self.studentsview.collection.dataSource = self;
    UINib *cellNib = [UINib nibWithNibName:@"StudentsList" bundle:nil];
    [self.studentsview.collection registerNib:cellNib forCellWithReuseIdentifier:@"Listcell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Listcell";
    StudentsListcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.cover.layer.cornerRadius = ((self.view.frame.size.width-80)/5-16)/2;

    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-80)/5, (self.view.frame.size.width-80)/5 + 29.5);
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
