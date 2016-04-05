//
//  MP3Player.h
//  AsrOralDemo
//
//  Created by 刘俊 on 15/6/26.
//  Copyright (c) 2015年 yunzhisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MP3Player : NSObject<AVAudioPlayerDelegate>
{
    NSString *filePath;
    AVAudioPlayer *player;
}

@property (nonatomic, assign) id delegate;

- (id)initWithPath:(NSString *)path;
- (BOOL) play;
- (void)stop;

-(void)playWithFile:(NSString *)path;

- (BOOL)playing;

- (NSTimeInterval)getDuration;

- (void)pause;
@end

@protocol MP3PlayerDelegate <NSObject>

-(void)playFinished:(NSError *)error;

@end
