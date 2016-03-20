//
//  MP3Player.m
//  AsrOralDemo
//
//  Created by 刘俊 on 15/6/26.
//  Copyright (c) 2015年 yunzhisheng. All rights reserved.
//

#import "MP3Player.h"

@implementation MP3Player

@synthesize delegate = _delegate;

- (id)initWithPath:(NSString *)path
{
    if (self = [super init])
    {
        NSURL *recordingURL= [[NSURL alloc] initFileURLWithPath:path];
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:recordingURL error:nil];
        [player prepareToPlay];
    }
    
    return self;
}


- (BOOL) play
{
    NSLog(@"play");
    
    return [player play];
}

-(void)playWithFile:(NSString *)path
{
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    player = [[AVAudioPlayer alloc]initWithData:data error:nil];
    player.delegate = self;
    [player prepareToPlay];
}

- (void) stop
{
    [player stop];
    
    //AudioSessionSetActive (false);
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (_delegate != nil && [_delegate respondsToSelector:@selector(playFinished:)])
    {
        [self.delegate playFinished:nil];
    }
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
     NSLog(@"error : %@",error);
}

@end
