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
static BOOL viewhiden;

@interface dajishiview : UIView
@property (strong, nonatomic) IBOutlet UILabel *time;

@end

@implementation dajishiview


@end

@interface yuyincepingxiangqing : UIView

@end
@implementation yuyincepingxiangqing


@end

@interface yuyincepingmain ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)MyUITableView *tableView;
@property (nonatomic, strong)dajishiview *dajishiview;
@property (nonatomic, strong)yuyincepingxiangqing *yuyincepingxiangqing;



@end

@implementation yuyincepingmain
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"yuyincepingview";
    yuyincepingview *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"yuyincepingmain" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#pragma mark
    //测试倒计时背景图
    self.dajishiview = [[NSBundle mainBundle] loadNibNamed:@"daojishiview" owner:nil options:nil].lastObject;
    self.dajishiview.frame = self.view.bounds;
    [self buttonTime];
    [self.view addSubview:self.dajishiview];
    
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
                self.yuyincepingxiangqing = [[NSBundle mainBundle] loadNibNamed:@"yuyinpingce" owner:nil options:nil].lastObject;
                self.yuyincepingxiangqing.frame = self.view.bounds;
                [self.view addSubview:self.yuyincepingxiangqing];
                self.title = @"小咖脱口秀语音测评";
                viewhiden = true;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
