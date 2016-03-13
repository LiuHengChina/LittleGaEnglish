//
//  dancipingce.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/13.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "dancipingce.h"
#import "MyUITableView.h"
#import "dancipingcecellTableViewCell.h"
#import "ReactiveCocoa.h"
@interface cuotijiexi : UIView
@property (strong, nonatomic) IBOutlet UILabel *danci;
@property (strong, nonatomic) IBOutlet UILabel *a;
@property (strong, nonatomic) IBOutlet UILabel *b;
@property (strong, nonatomic) IBOutlet UILabel *c;
@property (strong, nonatomic) IBOutlet UILabel *d;
@property (strong, nonatomic) IBOutlet UILabel *zhengquedaan;
@property (strong, nonatomic) IBOutlet UILabel *cuowudaan;
@property (strong, nonatomic) IBOutlet UITextView *cuotijiexi;

@end

@implementation cuotijiexi
- (IBAction)xiayicuoti:(UIButton *)sender {
}


@end
@interface collectionViewcell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *cuotijieguo;

@end
@implementation collectionViewcell
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.cuotijieguo.layer.borderColor = [UIColor redColor].CGColor;
}

@end

@interface dancipingcecellcoller : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;
@property (strong, nonatomic) IBOutlet UIButton *fenxiangchengji;
@property (strong, nonatomic) IBOutlet UIButton *zailaiyici;

@end
@implementation dancipingcecellcoller
- (IBAction)fenxiangchengji:(UIButton *)sender {
    NSLog(@"分享成绩");
}
- (IBAction)zailaiyici:(id)sender {
    NSLog(@"再来一次");
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    UINib *cellNib = [UINib nibWithNibName:@"dancipingcecell" bundle:nil];
    [self.collection registerNib:cellNib forCellWithReuseIdentifier:@"dancipingcecell"];
    self.fenxiangchengji.layer.borderColor = [UIColor colorWithRed:58.0f/255.0f green:171.0f/255.0f blue:248.0f/255.0f alpha:1].CGColor;
    self.zailaiyici.layer.borderColor = [UIColor colorWithRed:58.0f/255.0f green:171.0f/255.0f blue:248.0f/255.0f alpha:1].CGColor;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"dancipingcecell";
    collectionViewcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (self.collection.contentSize.width<self.frame.size.width) {
        self.widht.constant = self.collection.contentSize.width;
    }
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(20, 20);
}
@end

@interface xuanzexuanxiang : UIView
@property (strong, nonatomic) IBOutlet UILabel *daojishi;
@property (strong, nonatomic) IBOutlet UIImageView *D;
@property (strong, nonatomic) IBOutlet UIImageView *C;
@property (strong, nonatomic) IBOutlet UILabel *danci;
@property (strong, nonatomic) IBOutlet UILabel *xuanxianga;
@property (strong, nonatomic) IBOutlet UILabel *xuanxiangb;
@property (strong, nonatomic) IBOutlet UILabel *xuanxiangc;
@property (strong, nonatomic) IBOutlet UILabel *xuanxiangd;
@property (strong, nonatomic) IBOutlet UIImageView *A;
@property (strong, nonatomic) IBOutlet UIImageView *B;

@end

@implementation xuanzexuanxiang

@end

@interface dancipingce ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)MyUITableView *tableView;
@property (nonatomic, strong)xuanzexuanxiang *viewxuanze;
@property (nonatomic, strong)dancipingcecellcoller *dancipingcewancheng;
@property (nonatomic, strong)cuotijiexi *cuoti;

@end

@implementation dancipingce

-(void)loadView
{
    self.view = [UIView new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的测评";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    UIColor *white = [UIColor whiteColor];
    [self.navigationController.navigationBar setTintColor:white];
    self.tableView = [[MyUITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor colorWithRed:250.0f/255.0f green:250.0f/255.0f blue:250.0f/255.0f alpha:1];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.view = self.tableView;

    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"dancipingcecellTableViewCell";
    dancipingcecellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"dancipingce" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.viewxuanze = [[NSBundle mainBundle] loadNibNamed:@"dancipingcexiangqing" owner:nil options:nil].lastObject;
    self.viewxuanze.frame = self.view.bounds;
    [self tapview:self.viewxuanze];
    [self buttonTime:self.viewxuanze];
    [self.view addSubview:self.viewxuanze];
}
-(void)tapview:(xuanzexuanxiang *)view
{
    [view.A addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuana)]];
    [view.B addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanb)]];
    [view.C addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanc)]];
    [view.D addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuand)]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)xuana
{
    self.viewxuanze.A.image = [UIImage imageNamed:@"xuanA"];
    self.dancipingcewancheng = [[NSBundle mainBundle] loadNibNamed:@"wanchengdanci" owner:nil options:nil].lastObject;
    self.dancipingcewancheng.frame = self.view.bounds;
    self.dancipingcewancheng.collection.delegate = self.dancipingcewancheng;
    self.dancipingcewancheng.collection.dataSource = self.dancipingcewancheng;
    [self.view addSubview:self.dancipingcewancheng];

}
-(void)xuanb
{
    self.viewxuanze.B.image = [UIImage imageNamed:@"xuanB"];
    self.cuoti = [[NSBundle mainBundle] loadNibNamed:@"dancicuoti" owner:nil options:nil].lastObject;
    self.cuoti.frame = self.view.bounds;
    [self.view addSubview:self.cuoti];
    RACSignal *xiayicuoti = [self.cuoti rac_signalForSelector:@selector(xiayicuoti:)];
    [xiayicuoti subscribeNext:^(id x) {
        NSLog(@"下一个错题");
    }];
    
}
-(void)xuanc
{
    self.viewxuanze.C.image = [UIImage imageNamed:@"xuanC"];
}
-(void)xuand
{
    self.viewxuanze.D.image = [UIImage imageNamed:@"xuanD"];
}
-(void)buttonTime:(xuanzexuanxiang *)view
{
    //多线程控制按钮倒计时
    @weakify(self)
    __block int timeout=10; //倒计时时间
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                view.daojishi.text = @"0";

                
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.1d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                view.daojishi.text = strTime;

            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
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
