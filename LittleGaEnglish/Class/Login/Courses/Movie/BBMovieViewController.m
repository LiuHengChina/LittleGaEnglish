//
//  BBMovieViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/4/1.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBMovieViewController.h"

#import "SkinVideoViewController.h"
#import "PvVideo.h"
#import "PolyvSettings.h"

@interface BBMovieViewController ()
@property (nonatomic, strong)  SkinVideoViewController*videoPlayer;

@end

@implementation BBMovieViewController

-(void)moviePlayBackDidFinish:(NSNotification *)notification{
    NSLog(@"finished");
}

-(void)movieLoadStateDidChange:(NSNotification *)notification{
    
}

-(void)viewDidDisappear:(BOOL)animated {
    self.videoPlayer.contentURL = nil;
    [self.videoPlayer stop];
    [self.videoPlayer cancel];
    [self.videoPlayer cancelObserver];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super viewDidDisappear:animated];
}


- (void) showConfirmationAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"流量提示"
                                                   message:@"3G网络下继续播放?"
                                                  delegate:self
                                         cancelButtonTitle:@"停止播放"
                                         otherButtonTitles:@"继续播放",nil];
    [alert show];
    
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 0 = Tapped yes
    if (buttonIndex == 0)
    {
        // ....
        [self.videoPlayer stop];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.videoPlayer configObserver];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieLoadStateDidChange:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:nil];
}


- (void)viewDidLoad {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGFloat width = self.view.bounds.size.width;
    
    
    if (!self.videoPlayer) {
        self.videoPlayer = [[SkinVideoViewController alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, width, width*(9.0/16.0))];
        //self.videoPlayer = [[SkinVideoViewController alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, width, 100)];
    }
    
    
    [self.view addSubview:self.videoPlayer.view];
    //[self.videoPlayer setParentViewController:self];
    //需要保留导航栏
    [self.videoPlayer keepNavigationBar:YES];
    [self.videoPlayer setHeadTitle:self.videoName];
    //开启片头播放
    //[self.videoPlayer enableTeaser:YES];
    [self.videoPlayer setNavigationController:self.navigationController];
    [self.videoPlayer setVid:self.videoId];
    //直接跳到上一次播放位置
    //[self.videoPlayer setWatchStartTime:380];
    [self.videoPlayer play];
    //UIImage*logo = [UIImage imageNamed:@"pvlogo.png"];
    
    //[self.videoPlayer setLogo:logo location:PvLogoLocationTopLeft size:CGSizeMake(70,30) alpha:0.8];
    
    
    
    [self.videoPlayer setFullscreenBlock:^{
        NSLog(@"should hide toolbox in this viewcontroller if needed");
    }];
    [self.videoPlayer setShrinkscreenBlock:^{
        NSLog(@"show toolbox back if needed");
    }];
    
    
    //[self showConfirmationAlert];
    
    
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
