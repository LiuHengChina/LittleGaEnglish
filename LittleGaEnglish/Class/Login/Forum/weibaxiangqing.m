//
//  weibaxiangqing.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "weibaxiangqing.h"
#import "ReactiveCocoa.h"
#import "MyApiLunTan.h"
#import "MP3Player.h"
#import "comentpost.h"

@interface weibaxiangqingcell : UITableViewCell
@property (nonatomic, strong) ThreadDetailReplyModel *model;
@property (strong, nonatomic) IBOutlet UIImageView *titleImage;
@property (strong, nonatomic) IBOutlet UILabel *unameLab;
@property (strong, nonatomic) IBOutlet UIButton *mp3Lab;
@property (strong, nonatomic) IBOutlet UILabel *countenLab;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;

@property (nonatomic, strong) MP3Player *mp3;
@property (nonatomic, copy) void(^replyBlock)();

@end

@implementation weibaxiangqingcell

- (IBAction)replyBtnAction:(id)sender {
    if (self.replyBlock) {
        self.replyBlock();
    }
}

- (IBAction)zanBtnAction:(id)sender {
    [SVProgressHUD show];
    [[MyApiLunTan share]dianzanThreadWithPost_id:self.model.reply_id Success:^(MyApiLunTan *request) {
        [SVProgressHUD showSuccessWithStatus:@"点赞成功"];
    } Failure:^(MyApiLunTan *request, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (IBAction)playBtnAction:(id)sender {
    if (!self.mp3) {
        self.mp3 = [[MP3Player alloc]initWithPath:self.model.voice_url];
        [self.mp3 play];
        return;
    }
    if ([self.mp3 playing]) {
        [self.mp3 pause];
    } else {
        [self.mp3 play];
    }
}

- (void)setModel:(ThreadDetailReplyModel *)model
{
    _model = model;
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil completed:nil];
    self.unameLab.text = model.uname;
    self.countenLab.text = model.content;
    self.timeLab.text = [NSString matterTime:[NSNumber numberWithInteger:[model.ctime integerValue]]];
    if (model.voice_url == nil) {
        self.mp3Lab.hidden = YES;
    } else {
        [self.mp3Lab setTitle:model.voice_time_long forState:UIControlStateNormal];
    }
}

@end

@interface weibaxiangqing ()<UITableViewDelegate,UITableViewDataSource, UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imagecover; // 头像
@property (strong, nonatomic) IBOutlet UILabel *xiaokadaka; // 标题
@property (strong, nonatomic) IBOutlet UILabel *name;   // 昵称
@property (strong, nonatomic) IBOutlet UILabel *dengji; // 等级
@property (strong, nonatomic) IBOutlet UILabel *shijie; //
@property (strong, nonatomic) IBOutlet UILabel *weiba; // 微吧
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *julizuo;
@property (strong, nonatomic) IBOutlet UILabel *shijian;    // 时间
@property (strong, nonatomic) IBOutlet UITextView *contentText;
@property (strong, nonatomic) IBOutlet UIImageView *videoImage; // 视频图片

@property (strong, nonatomic) IBOutlet UIButton *shoucangBtn;
@property (strong, nonatomic) IBOutlet UIButton *dianzanBtn;
@property (strong, nonatomic) IBOutlet UIButton *pinglunBtn;


@property (strong, nonatomic) IBOutlet UIProgressView *jindutiao;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *gaodu;

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UIScrollView *shuaixinjiadescro;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tabbargaodu;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widhtbutton;


@property (nonatomic, strong) ThreadDetailInfoModel *infoModel;
@property (nonatomic, strong) NSMutableArray<ThreadDetailReplyModel *> *dataArr;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) MP3Player *mp3;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *headerHeight;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation weibaxiangqing

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.webView.delegate = self;
    
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
    [self getDta];
    
    
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
    if (self.dataArr != nil) {
        return self.dataArr.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    weibaxiangqingcell *cell = [tableView dequeueReusableCellWithIdentifier:@"weibaxiangqingcell" forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
    cell.replyBlock = ^(){
        comentpost *postVC = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil]instantiateViewControllerWithIdentifier:@"comentpost"];
        postVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:postVC animated:YES completion:nil];
    };
    return cell;
}
- (IBAction)xihuan:(id)sender {
    NSLog(@"xihuan");
    [SVProgressHUD show];
    [[MyApiLunTan share]favThreadWithPost_id:self.thread_id Success:^(MyApiLunTan *request) {
        [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
    } Failure:^(MyApiLunTan *request, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];

}
- (IBAction)dianzan:(id)sender {
    NSLog(@"dianzan");
    [SVProgressHUD show];
    [[MyApiLunTan share]dianzanThreadWithPost_id:self.thread_id Success:^(MyApiLunTan *request) {
        [SVProgressHUD showSuccessWithStatus:@"点赞成功"];
    } Failure:^(MyApiLunTan *request, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}
- (IBAction)pinglun:(id)sender {
    comentpost *postVC = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil]instantiateViewControllerWithIdentifier:@"comentpost"];
    postVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:postVC animated:YES completion:nil];
}

- (void)setInfoModel:(ThreadDetailInfoModel *)infoModel
{
    _infoModel = infoModel;
    self.name.text = infoModel.uname;
    self.xiaokadaka.text = infoModel.title;
    self.dengji.text = [NSString stringWithFormat:@"Lv%@",infoModel.authority_level];
    self.weiba.text = infoModel.weiba_name;
    self.shijie.text = [NSString matterTime:[NSNumber numberWithInteger:[infoModel.post_time integerValue]]];
    [self.shoucangBtn setTitle:infoModel.favorite forState:UIControlStateNormal];
    [self.dianzanBtn setTitle:infoModel.praise forState:UIControlStateNormal];
    [self.pinglunBtn setTitle:infoModel.reply_count forState:UIControlStateNormal];
    
    [self.webView loadHTMLString:infoModel.content baseURL:nil];
    
    if (!infoModel.voice_url) {
        self.shijian.text = @"00：00";
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"]floatValue];
    self.headerHeight.constant = height;
    [self.view layoutIfNeeded];
}

- (void)getDta
{
    [SVProgressHUD show];
    [[MyApiLunTan share] getThreadDetailWithThread_id:self.thread_id page:[NSString stringWithFormat:@"%ld",(long)self.page] Success:^(MyApiLunTan *request, ThreadDetailModel *model) {
        [SVProgressHUD showSuccessWithStatus:@""];
        if (model.replyList.count == 0) {
            return ;
        }
        self.page ++;
        
        if (!self.dataArr) {
            self.dataArr = model.replyList;
        } else {
            [self.dataArr addObjectsFromArray:model.replyList];
        }
        self.infoModel = model.threadInfo;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
        });
        
    } Failure:^(MyApiLunTan *request, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];

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
