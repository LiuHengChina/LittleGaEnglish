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
#import "KaoTiListModel.h"
#import "MyApiEvaluation.h"

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

@property (nonatomic, strong) KaoTiModel *model; // 考题
@property (strong, nonatomic) IBOutlet UILabel *daojishi;
@property (strong, nonatomic) IBOutlet UIImageView *D;
@property (strong, nonatomic) IBOutlet UIImageView *C;
@property (strong, nonatomic) IBOutlet UILabel *danci;
@property (strong, nonatomic) IBOutlet UIImageView *A;
@property (strong, nonatomic) IBOutlet UILabel *Alabel;
@property (strong, nonatomic) IBOutlet UILabel *BLabel;
@property (strong, nonatomic) IBOutlet UILabel *CLabel;
@property (strong, nonatomic) IBOutlet UILabel *Dlabel;

@property (strong, nonatomic) IBOutlet UIImageView *B;
@property (strong, nonatomic) IBOutlet UILabel *xuanxianga;
@property (strong, nonatomic) IBOutlet UILabel *xuanxiangb;
@property (strong, nonatomic) IBOutlet UILabel *xuanxiangc;
@property (strong, nonatomic) IBOutlet UILabel *xuanxiangd;

@property (nonatomic, strong) NSArray *answerArr;    // 答案数组
@property (nonatomic, strong) NSArray *kaotiArr;     // 考题数组
@property (nonatomic, strong) NSArray *xuanxiangArr; // 选项卡数组


@property (strong, nonatomic) IBOutlet UILabel *TipLabel;

@end

@implementation xuanzexuanxiang

- (void)awakeFromNib
{
    self.kaotiArr = @[_xuanxianga,_xuanxiangb,_xuanxiangc,_xuanxiangd];
    self.answerArr = @[_A, _B, _C, _D];
    self.xuanxiangArr = @[_Alabel, _BLabel, _CLabel, _Dlabel];
}


- (void)setModel:(KaoTiModel *)model
{
    self.TipLabel.text = model.subject;
    int i = 0;
    for (; i < model.option.count; i++) {
        UILabel *label = _kaotiArr[i];
        label.text = model.option[i];
    }
    for (; i < _kaotiArr.count; i++) {
        UILabel *kaotiLabel = _kaotiArr[i];
        UILabel *xuanxiangLabel = _xuanxiangArr[i];
        UIImageView *answerImage = _answerArr[i];
        kaotiLabel.hidden = YES;
        xuanxiangLabel.hidden = YES;
        answerImage.hidden = YES;
    }
}






@end


#pragma mark - 单词评测
@interface dancipingce ()<UITableViewDataSource,UITableViewDelegate>

{
    dispatch_source_t _mysource;
}

@property (nonatomic, strong)MyUITableView *tableView;
@property (nonatomic, strong)xuanzexuanxiang *viewxuanze;
@property (nonatomic, strong)dancipingcecellcoller *dancipingcewancheng;
@property (nonatomic, strong)cuotijiexi *cuoti;
@property (nonatomic, strong)EvaluationModel *model;    // 评测列表
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong)NSMutableArray<KaoTiModel *> *kaoTilistArr; // 考题list
@property (nonatomic, assign) NSInteger nowIndex; // 当前考题题号
@property (nonatomic, strong) NSMutableArray *choosekaotiArr; // 用户选择的答案

@end

@implementation dancipingce

-(void)loadView
{
    self.view = [UIView new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.nowIndex = 0;
    self.choosekaotiArr = [NSMutableArray array];
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
    WS(wself);
    self.tableView.canRefreshHeader = YES;
    self.tableView.headerRefreshingBlock = ^(){
        [wself getData];
    };

    [self getData];
    // Do any additional setup after loading the view.
}

- (void)getData
{
    [[MyApiEvaluation share]sendRequestWithType:@"2" page:[NSString stringWithFormat:@"%ld",(long)self.page] Success:^(MyApiEvaluation *request, EvaluationModel *model) {
        if (model != nil && model.list.count > 0) {
            self.page++;
            if (!self.model) {
                self.model = model;
            } else {
                [self.model.list addObjectsFromArray:model.list];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    } Failure:^(MyApiEvaluation *request, NSError *requestError) {
        [WDTipsView showTipsViewWithString:requestError.domain];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.model != nil) {
        return self.model.list.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"dancipingcecellTableViewCell";
    dancipingcecellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"dancipingce" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    EvaluationListModel *model = self.model.list[indexPath.row];
    cell.model = model;
    cell.chickBeginBlock = ^(){
        [[MyApiEvaluation share]getKaotiWithID:model.id Success:^(MyApiEvaluation *request, NSMutableArray *arr) {
            if (arr.count > 0) {
                self.kaoTilistArr = arr;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showKaoTiView];
                });
            }
        } Failure:^(MyApiEvaluation *request, NSError *requestError) {
            [WDTipsView  showTipsViewWithString:requestError.domain];
        }];
    };
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)showKaoTiView
{
    if ([self.view.subviews containsObject:self.viewxuanze]) {
        [self.viewxuanze removeFromSuperview];
    }
    
    if (self.nowIndex >= self.kaoTilistArr.count) {
        [self chooseFinish];
        return;
    }
    
    self.viewxuanze = [[NSBundle mainBundle] loadNibNamed:@"dancipingcexiangqing" owner:nil options:nil].lastObject;
    self.viewxuanze.frame = self.view.bounds;
    [self tapview:self.viewxuanze];
    self.viewxuanze.model = _kaoTilistArr[_nowIndex];
    [self buttonTime:self.viewxuanze];
    [self.view addSubview:self.viewxuanze];
    self.nowIndex++;
}

-(void)tapview:(xuanzexuanxiang *)view
{
    [view.A addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuana)]];
    [view.B addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanb)]];
    [view.C addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanc)]];
    [view.D addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuand)]];
}


#pragma mark 成绩结果
- (void)chooseFinish
{
    self.dancipingcewancheng = [[NSBundle mainBundle] loadNibNamed:@"wanchengdanci" owner:nil options:nil].lastObject;
    self.dancipingcewancheng.frame = self.view.bounds;
    self.dancipingcewancheng.collection.delegate = self.dancipingcewancheng;
    self.dancipingcewancheng.collection.dataSource = self.dancipingcewancheng;
    [self.view addSubview:self.dancipingcewancheng];
}


- (void)chooseError
{
    self.cuoti = [[NSBundle mainBundle] loadNibNamed:@"dancicuoti" owner:nil options:nil].lastObject;
    self.cuoti.frame = self.view.bounds;
    [self.view addSubview:self.cuoti];
    RACSignal *xiayicuoti = [self.cuoti rac_signalForSelector:@selector(xiayicuoti:)];
    [xiayicuoti subscribeNext:^(id x) {
        NSLog(@"下一个错题");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)xuana
{
    self.viewxuanze.A.image = [UIImage imageNamed:@"xuanA"];
    [self chooseAnswer:@"A"];
}
-(void)xuanb
{
    self.viewxuanze.B.image = [UIImage imageNamed:@"xuanB"];
    [self chooseAnswer:@"B"];
}
-(void)xuanc
{
    self.viewxuanze.C.image = [UIImage imageNamed:@"xuanC"];
    [self chooseAnswer:@"C"];
}
-(void)xuand
{
    self.viewxuanze.D.image = [UIImage imageNamed:@"xuanD"];
    [self chooseAnswer:@"D"];
}

- (void)chooseAnswer:(NSString *)answer
{
    [self.choosekaotiArr addObject:@{@"kt_id":self.kaoTilistArr[self.nowIndex - 1].id,
                              @"answer":answer}];
    [self showKaoTiView];
}

-(void)buttonTime:(xuanzexuanxiang *)view
{
    
    if (_mysource) {
        dispatch_suspend(_mysource);
    }
    //多线程控制按钮倒计时
    @weakify(self)
    __block int timeout=10; //倒计时时间
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    _mysource = _timer;
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                view.daojishi.text = @"0";
                [self xuana];
                dispatch_suspend(_timer);
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
