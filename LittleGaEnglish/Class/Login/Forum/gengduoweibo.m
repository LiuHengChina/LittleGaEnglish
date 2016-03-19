//
//  gengduoweibo.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "gengduoweibo.h"
#import "weiba.h"
@interface gengduoweibocell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageweiba;

@end

@implementation gengduoweibocell

@end

@interface gengduoweibo ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;

@end

@implementation gengduoweibo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)weiba:(id)sender {
    weiba *wei = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil] instantiateViewControllerWithIdentifier:@"weiba"];
    wei.str = @"传值";
    [self.navigationController pushViewController:wei animated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    gengduoweibocell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gengduoweibocell" forIndexPath:indexPath];
    
    return cell;
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
