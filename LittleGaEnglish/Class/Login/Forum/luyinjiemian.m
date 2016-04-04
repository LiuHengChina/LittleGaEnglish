//
//  luyinjiemian.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "luyinjiemian.h"
#import "EngineManager.h"
#import <UAProgressView/UAProgressView.h>
#import "MyApiLunTan.h"

@interface luyinjiemian ()<EngineManagerDelegate>
@property (strong, nonatomic) IBOutlet UAProgressView *previews;
//@property (nonatomic, assign) CGFloat localProgress;
@property (assign,nonatomic) BOOL jindubool;
@property (assign,nonatomic) NSInteger datatime;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) EngineManager *enginer;
@property (strong, nonatomic) IBOutlet UILabel *timeLab;

@end

@implementation luyinjiemian
- (IBAction)dismissview:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)luyinkaishi:(id)sender {
    self.jindubool = false;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ttttt];
    self.previews.progress = 0;
    self.datatime = 0;
    [self initEngineManager];

    WS(wself);
    self.previews.didSelectBlock = ^(UAProgressView *progressView){
        if (wself.jindubool) {
            if (wself.timer != nil) {
                [wself.enginer stopRecognize];
                [wself.timer invalidate];
            }
        } else {
            wself.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:wself selector:@selector(updateProgress:) userInfo:nil repeats:YES];
            wself.datatime = 0;
            [wself.enginer setOralText:@"empty"];
            [wself.enginer startRecognize];
        }
        wself.jindubool = !wself.jindubool;
    };
    // Do any additional setup after loading the view.
}
-(void)ttttt
{
    self.previews.tintColor = [UIColor grayColor];
    self.previews.borderWidth = 0;
    self.previews.lineWidth = 2;
}
- (void)updateProgress:(NSTimer *)timer {
    self.datatime++;
    NSLog(@"总时长180秒 %ld",(long)self.datatime);
    if (self.datatime > 180) {
        [self.timer invalidate];
    }
    [self.previews setProgress:(float)self.datatime/180];
    self.timeLab.text = [NSString formatWithInter:self.datatime];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
