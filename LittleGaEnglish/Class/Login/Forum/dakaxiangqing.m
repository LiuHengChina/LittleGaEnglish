//
//  dakaxiangqing.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "dakaxiangqing.h"
#import "ReactiveCocoa.h"

@interface dakaxiangqingcell : UITableViewCell

@end
@implementation dakaxiangqingcell


@end

@interface dakaxiangqing ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *titleview;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;
@property (strong, nonatomic) IBOutlet UILabel *daojishi;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *julizuo;
@property (strong, nonatomic) IBOutlet UIProgressView *jindu;

@end

@implementation dakaxiangqing

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self)
    [RACObserve(self, jindu.progress) subscribeNext:^(id x) {
        @strongify(self)
        self.julizuo.constant = (self.view.frame.size.width - 70 - 112) * [x floatValue] + 70;
    }];
    // Do any additional setup after loading the view.
}
- (IBAction)bofangjindu:(id)sender {
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
                self.jindu.progress = 1;
            });
        }else{
            int seconds = timeout % 120;
            //            NSString *strTime = [NSString stringWithFormat:@"%.1d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                @strongify(self)
                //5是总的秒数
                self.jindu.progress = (5 - (float)seconds)/5;
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
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    dakaxiangqingcell *cell = [tableView dequeueReusableCellWithIdentifier:@"dakaxiangqingcell" forIndexPath:indexPath];
    
    return cell;
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
