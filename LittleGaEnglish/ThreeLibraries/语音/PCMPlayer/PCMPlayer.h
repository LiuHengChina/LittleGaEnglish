//
//  PCMPlayer.h
//  PCMPlayer
//
//  Created by 刘俊 on 14-9-24.
//  Copyright (c) 2014年 yunzhisheng. All rights reserved.
//

#define BUFFER_SIZE           3          //队列缓冲个数
#define EVERY_READ_LENGTH     3200       //每次从文件读取的长度
#define MIN_SIZE_PER_FRAME    2000       //每侦最小数据长度

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface PCMPlayer : NSObject
{
    AudioStreamBasicDescription audioDescription;///音频参数
    AudioQueueRef audioQueue;//音频播放队列
    AudioQueueBufferRef audioQueueBuffers[BUFFER_SIZE];//音频缓存
    NSLock *synlock ;///同步控制
    Byte *pcmDataBuffer;//pcm的读文件数据区
    FILE *file;//pcm源文件
}

@property (nonatomic, assign) int sampleRate;
@property (nonatomic, assign) NSMutableArray *recordingQueue;
@property (nonatomic, assign) NSMutableData *recordingDatas;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) BOOL finish;//播放完成

- (id)initWithFile:(NSString *)path;
- (void) play;
- (void) stop;

@end

@protocol PCMPlayerDelegate <NSObject>

-(void)playFinished:(NSError *)error;

@end
