//
//  yuyincepingmain.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/11.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "yuyincepingmain.h"
#import "yuyincepingview.h"
#import "MyUITableView.h"
#import "ReactiveCocoa.h"
#import "UIViewController+BackButtonHandler.h"
#import "MyApiEvaluation.h"
#import "EngineManager.h"
#import "YuYinDetailViewController.h"
#import <UAProgressView/UAProgressView.h>

static BOOL viewhiden;



#pragma mark ---
@interface dajishiview : UIView
@property (strong, nonatomic) IBOutlet UILabel *time;

@end

@implementation dajishiview


@end



#pragma Mark ---语音评测详情
@interface yuyincepingxiangqing : MyUIView <EngineManagerDelegate>

@property (strong, nonatomic) IBOutlet UAProgressView *previewfer;
@property (assign,nonatomic) BOOL jindubool;
@property (assign,nonatomic) NSInteger datatime;


@property (nonatomic, copy) NSString *dataId;
@property (nonatomic, copy) NSString *kaoTiId;
@property (strong, nonatomic) IBOutlet UITextView *yuyinText;

@property (nonatomic, assign) BOOL isBegin;

@property (strong, nonatomic) IBOutlet UILabel *timeLab;
@property (strong, nonatomic) IBOutlet UILabel *luyinLab;

@property (nonatomic, strong) NSMutableString *resultText;
@property (nonatomic, strong) EngineManager *enginer;

@property (nonatomic, copy) NSString *userText;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, assign) BOOL canPlay;
@property (nonatomic, strong) NSTimer * timer;

@end
@implementation yuyincepingxiangqing

- (void)awakeFromNib
{
    [self initEngineManager];
    
    self.jindubool = true;
    [self ttttt];
    self.previewfer.progress = 0;
    self.datatime = 0;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

    @weakify(self)
    self.previewfer.didSelectBlock = ^(UAProgressView *progressView){
        @strongify(self)
        [self tapAction:nil];
    };
    viewhiden = true;

    
}

-(void)ttttt
{
    self.previewfer.tintColor = [UIColor grayColor];
    self.previewfer.borderWidth = 0;
    self.previewfer.lineWidth = 2;
}
- (void)updateProgress:(NSTimer *)timer {
    if (self.datatime > 180) {
        [_enginer stopRecognize];
        return;
    }
    self.datatime++;
    NSLog(@"总时长180秒 %ld",(long)self.datatime);
    self.timeLab.text = [NSString formatWithInter:self.datatime];
    [self.previewfer setProgress:(float)self.datatime/180];
    
}
-(void)initEngineManager
{
    self.enginer = [EngineManager sharedManager];
    self.enginer.delegate = self;
}

- (void)setDataId:(NSString *)dataId
{
    _dataId = dataId;
    [self getData];
}

- (IBAction)tapAction:(id)sender {
    if (self.canPlay) {
        _isBegin = !_isBegin;
        if (_isBegin) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
            [_enginer setOralText:_yuyinText.text];
            [_enginer startRecognize];
        } else{
            [_enginer stopRecognize];
            [self.timer invalidate];
        }
    } else {
        [WDTipsView showTipsViewWithString:@"请稍等"];
    }
}

- (void)getData
{
    [[MyApiEvaluation share]getKaotiWithID:_dataId Success:^(MyApiEvaluation *request, NSMutableArray *arr) {
        if (arr.count > 0) {
            KaoTiModel *model = arr[0];
            self.yuyinText.text = model.subject;
            self.kaoTiId = model.id;
            self.canPlay = YES;
        }
    } Failure:^(MyApiEvaluation *request, NSError *requestError) {
        [WDTipsView  showTipsViewWithString:requestError.domain];
    }];
}


#pragma mark USCRecognizerDelegate

- (void)onBeginOral
{
    NSLog(@"开始");
//    [self currentCondition:@"开始录音" error:NO finish:NO];
}

- (void)onStopOral
{
    NSLog(@"停止");
}

// 识别结果
- (void)onResult:(NSString *)result isLast:(BOOL)isLast
{
    NSLog(@"%@",result);
    NSDictionary *resultDic = [NSString dictionaryWithJsonString:result];
    NSArray *lineArr = resultDic[@"lines"];
    NSDictionary *dic = lineArr[0];
    self.userText = dic[@"usertext"];
    self.score = dic[@"score"];
}

- (void)onEndOral:(NSError *)error
{
    if (error)
    {
        NSLog(@"onEndOral | error = %@", error);
        NSString *errorStr = [NSString stringWithFormat:@"%@ \n %ld",error.domain,(long)error.code];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:errorStr
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        [[MyApiEvaluation share] addUserVoiceAnswer:self.dataId ktId:self.kaoTiId score:self.score user_answer:self.userText Success:^(MyApiEvaluation *request, NSMutableArray *arr) {
           
            YuYinDetailViewController *vc = [YuYinDetailViewController new];
            vc.sampleText = self.yuyinText.text;
            vc.userText = self.userText;
            vc.score = self.score;
            [self.VC.navigationController pushViewController:vc animated:YES];
            
        } Failure:^(MyApiEvaluation *request, NSError *requestError) {
            [WDTipsView showTipsViewWithString:requestError.domain];
        }];
    }
    
}

- (void)onUpdateVolume:(int)volume
{
    NSLog(@"onUpdateVolume");
}

- (void)onVADTimeout
{
    NSLog(@"超时");
}

- (void)onRecordingBuffer:(NSData *)recordingData
{
    NSLog(@"recordingDatas len=%lu", (unsigned long)recordingData.length);
}

- (void)oralEngineDidInit:(NSError *)error
{
    NSLog(@"oralEngineDidInit : %@ ",error);
}

- (void)audioFileDidRecord:(NSString *)url
{
    NSLog(@"--audioFileDidRecord : %@",url);
}

@end




#pragma Mark ---语音评测主页

@interface yuyincepingmain ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)MyUITableView *tableView;
@property (nonatomic, strong)dajishiview *dajishiview;
@property (nonatomic, strong) yuyincepingxiangqing *yuyincepingxiangqing;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) EvaluationModel *model;
@property (nonatomic, strong) NSString *dataId; // 试卷id

@end

@implementation yuyincepingmain
-(void)loadView
{
    self.view = [UIView new];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的测评";
    [self setCustomNavLeftBarButton:nil responderBlcok:nil];
    //    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
//    UIColor *white = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTintColor:white];
    self.tableView = [[MyUITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor colorWithRed:250.0f/255.0f green:250.0f/255.0f blue:250.0f/255.0f alpha:1];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.view = self.tableView;
    
    [self getData];
    
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArr) {
        return self.dataArr.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"yuyincepingview";
    yuyincepingview *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"yuyincepingmain" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    cell.height_show = self.model.height_show;
    cell.middle_show = self.model.height_show;
    EvaluationListModel *model = self.dataArr[indexPath.row];
    cell.model = model;
    
    WS(wself);
    cell.chickBeginBlock = ^(){
        wself.dajishiview = [[NSBundle mainBundle] loadNibNamed:@"daojishiview" owner:nil options:nil].lastObject;
        wself.dajishiview.frame = self.view.bounds;
        [wself buttonTime];
        wself.dataId = model.id;
        [wself.view addSubview:self.dajishiview];
    };
    
    return cell;
}


-(void)buttonTime
{
    //多线程控制按钮倒计时
    @weakify(self)
    __block int timeout=5; //倒计时时间
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                self.dajishiview.hidden = YES;
                self.yuyincepingxiangqing = [[NSBundle mainBundle] loadNibNamed:@"yuyinpingce" owner:nil options:nil].firstObject;
                [self.view addSubview:self.yuyincepingxiangqing];
                self.yuyincepingxiangqing.frame = self.view.bounds;
                self.yuyincepingxiangqing.VC = self;
                self.yuyincepingxiangqing.dataId = self.dataId;
                self.title = @"小咖脱口秀语音测评";
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.1d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                self.dajishiview.time.text = strTime;
//                self.reCodeBtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL) navigationShouldPopOnBackButton
{
    if (viewhiden) {
        self.yuyincepingxiangqing.hidden = YES;
        viewhiden = false;
        self.title = @"我的测评";
        return NO;
    }
    return YES;
    
}

- (void)getData
{
    [[MyApiEvaluation share]sendRequestWithType:@"1" page:@"1" Success:^(MyApiEvaluation *request, EvaluationModel *model) {
        self.dataArr = model.list;
        self.model = model;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } Failure:^(MyApiEvaluation *request, NSError *requestError) {
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
