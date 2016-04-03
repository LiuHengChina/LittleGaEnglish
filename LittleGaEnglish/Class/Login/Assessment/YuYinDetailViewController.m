//
//  YuYinDetailViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "YuYinDetailViewController.h"
#import "MP3Player.h"
#import "EngineManager.h"

@interface YuYinDetailViewController ()
@property (strong, nonatomic) IBOutlet UITextView *sampleTextView;

@property (strong, nonatomic) IBOutlet UITextView *userTextView;
@property (strong, nonatomic) IBOutlet UILabel *scoreLab;
@property (nonatomic, strong) MP3Player *mp3;
@property (strong, nonatomic) IBOutlet UILabel *mp3Time;

@end

@implementation YuYinDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setCustomNavigationTitle:@"小咖脱口秀语音评测"];
    WS(wself);
    [self setCustomNavLeftBarButton:nil responderBlcok:^{
        [wself.navigationController popToRootViewControllerAnimated:YES];
    }];
    self.scoreLab.text =[NSString stringWithFormat:@"%@",self.score];
    self.sampleTextView.text = self.sampleText;
    self.userTextView.text = self.userText;

    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *recordingPath = [documentsDirectory stringByAppendingPathComponent:FILE_NAME_RECORDING];
    if ([[NSFileManager defaultManager] fileExistsAtPath:recordingPath])
    {
        NSLog(@"Play Start");
        if (self.mp3 == nil)
        {
            self.mp3 = [[MP3Player alloc]init];
            self.mp3.delegate = self;
        }
        [self.mp3 playWithFile:recordingPath];
    }
    self.mp3Time.text = [NSString TimeformatFromSeconds:self.mp3.getDuration];
}
- (IBAction)playAction:(id)sender {
    [self.mp3 play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setScore:(NSString *)score
{
    _score = score;
    self.scoreLab.text = score;
}

- (void)setSampleText:(NSString *)sampleText
{
    _sampleText = sampleText;
    self.sampleTextView.text = sampleText;
}

- (void)setUserText:(NSString *)userText
{
    _userText = userText;
    self.userTextView.text = userText;
}

- (IBAction)shareAction:(id)sender {
    [WDTipsView showTipsViewWithString:@"分享"];
}

- (IBAction)againAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
