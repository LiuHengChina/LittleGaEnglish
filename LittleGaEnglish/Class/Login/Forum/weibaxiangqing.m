//
//  weibaxiangqing.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "weibaxiangqing.h"
#import "ReactiveCocoa.h"

@interface weibaxiangqingcell : UITableViewCell

@end

@implementation weibaxiangqingcell

@end

@interface weibaxiangqing ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *imagecover;
@property (strong, nonatomic) IBOutlet UILabel *xiaokadaka;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *dengji;
@property (strong, nonatomic) IBOutlet UILabel *shijie;
@property (strong, nonatomic) IBOutlet UILabel *weiba;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *julizuo;
@property (strong, nonatomic) IBOutlet UILabel *shijian;
@property (strong, nonatomic) IBOutlet UIProgressView *jindutiao;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *gaodu;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UIScrollView *shuaixinjiadescro;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tabbargaodu;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widhtbutton;

@end

@implementation weibaxiangqing

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%ld",self.idd);
    
    self.widhtbutton.constant = self.view.frame.size.width/3;
    self.jindutiao.progress = 0;
    @weakify(self)
    [RACObserve(self, jindutiao.progress) subscribeNext:^(id x) {
        @strongify(self)
            self.julizuo.constant = (self.view.frame.size.width - 60 - 111) * [x floatValue] + 60;
     }];
    [RACObserve(self, tableview.contentSize) subscribeNext:^(id x) {
        @strongify(self)
        self.gaodu.constant = self.tableview.contentSize.height + 410;
        self.tabbargaodu.constant = self.view.frame.size.height-40;

    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bofangshijian:(id)sender {
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
                self.jindutiao.progress = 1;
            });
        }else{
            int seconds = timeout % 120;
//            NSString *strTime = [NSString stringWithFormat:@"%.1d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                //5是总的秒数
                self.jindutiao.progress = (5 - (float)seconds)/5;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    weibaxiangqingcell *cell = [tableView dequeueReusableCellWithIdentifier:@"weibaxiangqingcell" forIndexPath:indexPath];
    
    return cell;
}
- (IBAction)xihuan:(id)sender {
}
- (IBAction)dianzan:(id)sender {
}
- (IBAction)pinglun:(id)sender {
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
