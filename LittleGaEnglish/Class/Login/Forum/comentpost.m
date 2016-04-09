//
//  comentpost.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/3.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "comentpost.h"
#import <UAProgressView/UAProgressView.h>
#import "xuanzeimage.h"
#import "MyApiLunTan.h"
#import "EngineManager.h"

@interface comentpost ()<EngineManagerDelegate>
@property (strong, nonatomic) IBOutlet UAProgressView *proess;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *jianpangaodu;
@property (assign,nonatomic) BOOL jindubool;
@property (assign,nonatomic) NSInteger datatime;

@property (nonatomic, strong) EngineManager *enginer;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *kuandu;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UITextField *pingluntext;
@end

@implementation comentpost

-(void)dianjiluzhidaanniu
{
    NSLog(@"录制开始");
    self.jindubool = false;
}
- (IBAction)luzhi:(id)sender {
    NSLog(@"fghj");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.pingluntext becomeFirstResponder];// 2
}
- (IBAction)fabuanniu:(id)sender {
    
    NSLog(@"%@",self.pingluntext.text);
    
    NSLog(@"fabu");
}
- (IBAction)luyinanniu:(id)sender {
    [self.pingluntext resignFirstResponder];
}
- (IBAction)dismissfanhui:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dianjiluzhi:(id)sender {
    [self initEngineManager];

    NSLog(@"点击录制");
}
- (IBAction)chongxinluzhi:(id)sender {
    NSLog(@"重新录制");
}
- (IBAction)xuanzezhaopian:(id)sender {
    self.jianpangaodu.constant = self.view.frame.size.height;
    [self performSegueWithIdentifier:@"xuangezhaopian" sender:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.jindubool = true;
    self.kuandu.constant = self.view.frame.size.width*2;
    [self ttttt];
    self.proess.progress = 0;
    self.datatime = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    self.proess.didSelectBlock = ^(UAProgressView *progressView){
        _jindubool = !_jindubool;
    };


    
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                    selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
}
-(void)ttttt
{
    self.proess.tintColor = [UIColor grayColor];
    self.proess.borderWidth = 0;
    self.proess.lineWidth = 2;
}
- (void)updateProgress:(NSTimer *)timer {
    if (self.jindubool || self.datatime > 180) {
        return;
    }
    self.datatime++;
    NSLog(@"总时长180秒 %ld",(long)self.datatime);
    [self.proess setProgress:(float)self.datatime/180];
    
}
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"hight_hitht:%f",kbSize.height);
    self.jianpangaodu.constant = self.view.frame.size.height - kbSize.height - 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"xuangezhaopian"]) {
        xuanzeimage *xuan = segue.destinationViewController;
        xuan.hahabool = true;
        xuan.callback = ^(UIImage *image) {
            NSLog(@"上传的图片image %@",image);
        };
    }
    
}




-(void)initEngineManager
{
    self.enginer = [EngineManager sharedManager];
    self.enginer.delegate = self;
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
    [SVProgressHUD show];
}

// 识别结果
- (void)onResult:(NSString *)result isLast:(BOOL)isLast
{
    NSLog(@"%@",result);
}

- (void)onEndOral:(NSError *)error
{
    if (error)
    {
        [SVProgressHUD dismiss];
        NSLog(@"onEndOral | error = %@", error);
        NSString *errorStr = [NSString stringWithFormat:@"%@ \n %ld",error.domain,(long)error.code];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:errorStr
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
        [alert show];
        
    } else {
        [[MyApiLunTan share] sendYuYinSuccess:^(MyApiLunTan *request, VoiceModel *model) {
            [SVProgressHUD showSuccessWithStatus:@"上传成功"];
            if (self.dataBlock) {
                self.dataBlock(model);
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        } Failure:^(MyApiLunTan *request, NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        } ];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
