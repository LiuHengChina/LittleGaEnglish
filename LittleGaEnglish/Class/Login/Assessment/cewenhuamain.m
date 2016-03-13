//
//  cewenhuamain.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/13.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "cewenhuamain.h"
#import "MyUITableView.h"
#import "ReactiveCocoa.h"

@interface wenhuacuoti : UIView
@property (strong, nonatomic) IBOutlet UILabel *danci;
@property (strong, nonatomic) IBOutlet UIImageView *a;
@property (strong, nonatomic) IBOutlet UIImageView *c;
@property (strong, nonatomic) IBOutlet UIImageView *d;
@property (strong, nonatomic) IBOutlet UIImageView *b;
@property (strong, nonatomic) IBOutlet UILabel *zhengque;
@property (strong, nonatomic) IBOutlet UILabel *cuowu;
@property (strong, nonatomic) IBOutlet UITextView *cuowujieshi;

@end
@implementation wenhuacuoti
- (IBAction)xiayicuoti:(id)sender {
}


@end
@interface wenhuajichengjicell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *cuoti;

@end
@implementation wenhuajichengjicell
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.cuoti.layer.borderColor = [UIColor redColor].CGColor;
}

@end
@interface wenhuajichengji : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collect;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;
@property (strong, nonatomic) IBOutlet UIButton *fenxiangchengji;
@property (strong, nonatomic) IBOutlet UIButton *zailaiyici;

@end

@implementation wenhuajichengji
- (IBAction)fenxiangchengji:(id)sender {
    NSLog(@"分享");
}

- (IBAction)zailaiyici:(id)sender {
    NSLog(@"再来一次");
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    UINib *cellNib = [UINib nibWithNibName:@"wenhuachengjicell" bundle:nil];
    [self.collect registerNib:cellNib forCellWithReuseIdentifier:@"wenhuajichengjicell"];

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"wenhuajichengjicell";
    wenhuajichengjicell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (self.collect.contentSize.width<self.frame.size.width) {
        self.widht.constant = self.collect.contentSize.width;
    }
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(20, 20);
}
@end

@interface ceshiwenhuaview : UIView
@property (strong, nonatomic) IBOutlet UILabel *danci;
@property (strong, nonatomic) IBOutlet UILabel *daojishi;
@property (strong, nonatomic) IBOutlet UIImageView *xuanxianga;
@property (strong, nonatomic) IBOutlet UIImageView *xuanxiangb;
@property (strong, nonatomic) IBOutlet UIImageView *xuanxiangc;
@property (strong, nonatomic) IBOutlet UIImageView *xuanxiangd;
@property (strong, nonatomic) IBOutlet UIImageView *A;
@property (strong, nonatomic) IBOutlet UIImageView *B;
@property (strong, nonatomic) IBOutlet UIImageView *C;
@property (strong, nonatomic) IBOutlet UIImageView *D;

@end
@implementation ceshiwenhuaview


@end

@interface cewenhuamaincell : UITableViewCell

@end
@implementation cewenhuamaincell


@end


@interface cewenhuamain ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)MyUITableView *tableView;
@property (nonatomic, strong)ceshiwenhuaview *ceshiwenhua;
@property (nonatomic, strong)wenhuajichengji *chengji;
@property (nonatomic, strong)wenhuacuoti *cuoti;
@end

@implementation cewenhuamain

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
    static NSString *identifier = @"cewenhuamaincell";
    cewenhuamaincell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"cewenhua" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.ceshiwenhua = [[NSBundle mainBundle] loadNibNamed:@"dancipingcexiangqing" owner:nil options:nil].lastObject;
    self.ceshiwenhua.frame = self.view.bounds;
    [self buttonTime:self.ceshiwenhua];
    [self tapview:self.ceshiwenhua];
    [self.view addSubview:self.ceshiwenhua];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)buttonTime:(ceshiwenhuaview *)view
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
-(void)tapview:(ceshiwenhuaview *)view
{
    [view.A addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuana)]];
    [view.B addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanb)]];
    [view.C addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanc)]];
    [view.D addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuand)]];
}
-(void)xuana
{
    self.ceshiwenhua.A.image = [UIImage imageNamed:@"xuanA"];
    self.chengji = [[NSBundle mainBundle] loadNibNamed:@"wenhuaceshiwancheng" owner:nil options:nil].lastObject;
    self.chengji.frame = self.view.bounds;
    self.chengji.collect.delegate = self.chengji;
    self.chengji.collect.dataSource = self.chengji;
    [self.view addSubview:self.chengji];
    
}
-(void)xuanb
{
    self.ceshiwenhua.B.image = [UIImage imageNamed:@"xuanB"];
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
    self.ceshiwenhua.C.image = [UIImage imageNamed:@"xuanC"];
}
-(void)xuand
{
    self.ceshiwenhua.D.image = [UIImage imageNamed:@"xuanD"];
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
