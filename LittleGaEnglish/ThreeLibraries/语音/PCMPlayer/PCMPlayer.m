//
//  PCMPlayer.m
//  PCMPlayer
//
//  Created by 刘俊 on 14-9-24.
//  Copyright (c) 2014年 yunzhisheng. All rights reserved.
//

#import "PCMPlayer.h"

@interface PCMPlayer ()

@end

@implementation PCMPlayer

@synthesize sampleRate = _sampleRate;
@synthesize recordingQueue = _recordingQueue;
@synthesize recordingDatas = _recordingDatas;
@synthesize delegate = _delegate;

- (id)initWithFile:(NSString *)path
{
    self = [super init];
    if (self)
    {
        //NSString *filepath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"se.pcm"];
        NSString *filepath = path;
        
        file  = fopen([filepath UTF8String], "r");
        if(file)
        {
            fseek(file, 0, SEEK_SET);
            pcmDataBuffer = (Byte *) malloc(EVERY_READ_LENGTH);
        }
        else
        {
            //NSLog(@"!!!!!!!!!!!!!!!!");
        }
        synlock = [[NSLock alloc] init];
        
        [self initAudio];
        
        self.finish = NO;
    }
    return self;
}

- (void) play
{
    AudioQueueStart(audioQueue, NULL);
    
    //[self readPCMData];
    
    for(int i=0;i<BUFFER_SIZE;i++)
    {
        [self readPCMAndPlay:audioQueue buffer:audioQueueBuffers[i]];
    }
}

- (void) stop
{
    AudioQueueStop(audioQueue, true);
    AudioQueueDispose(audioQueue, true);
}

#pragma mark -#pragma mark player call back

static void OutputCallback(void *outUserData, AudioQueueRef outAQ, AudioQueueBufferRef outBuffer)
{
    PCMPlayer *recorder = (__bridge PCMPlayer *)outUserData;
    if (recorder == nil)
    {
        return;
    }
    
    [recorder readPCMAndPlay:outAQ buffer:outBuffer];

    int length = outBuffer->mAudioDataByteSize;
    if (length < BUFFER_SIZE&&(!recorder.finish))
    {
        if ([recorder.delegate respondsToSelector:@selector(playFinished:)])
        {
            [recorder.delegate playFinished:nil];
        }
        
        recorder.finish = YES;
    }
}

-(void)initAudio
{
    ///设置音频参数
    audioDescription.mSampleRate = 16000;//采样率
    audioDescription.mFormatID = kAudioFormatLinearPCM;
    audioDescription.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
    audioDescription.mChannelsPerFrame = 1;///单声道
    audioDescription.mFramesPerPacket = 1;//每一个packet一侦数据
    audioDescription.mBitsPerChannel = 16;//每个采样点16bit量化
    audioDescription.mBytesPerFrame = (audioDescription.mBitsPerChannel/8) * audioDescription.mChannelsPerFrame;
    audioDescription.mBytesPerPacket = audioDescription.mBytesPerFrame ;
    
    ///创建一个新的从audioqueue到硬件层的通道
    //  AudioQueueNewOutput(&audioDescription, AudioPlayerAQInputCallback, self, CFRunLoopGetCurrent(), kCFRunLoopCommonModes, 0, &audioQueue);///使用当前线程播
    AudioQueueNewOutput(&audioDescription, OutputCallback, (__bridge void*)self, nil, nil, 0, &audioQueue);
    //使用player的内部线程播
    
    ////添加buffer区
    for(int i=0;i<BUFFER_SIZE;i++)
    {
        ///创建buffer区，MIN_SIZE_PER_FRAME为每一侦所需要的最小的大小，该大小应该比每次往buffer里写的最大的一次还大
        AudioQueueAllocateBuffer(audioQueue, MIN_SIZE_PER_FRAME, &audioQueueBuffers[i]);
    }
}

-(void)readPCMAndPlay:(AudioQueueRef)outQ buffer:(AudioQueueBufferRef)outQB
{
    [synlock lock];
    int readLength = (int) fread(pcmDataBuffer, 1, EVERY_READ_LENGTH, file);//读取文件
    //NSLog(@"read raw data size = %d",readLength);
    outQB->mAudioDataByteSize = readLength;
    Byte *audiodata = (Byte *)outQB->mAudioData;
    
    for(int i=0;i<readLength;i++)
    {
        audiodata[i] = pcmDataBuffer[i];
    }
    
    /*
     将创建的buffer区添加到audioqueue里播放
     AudioQueueBufferRef用来缓存待播放的数据区，AudioQueueBufferRef有两个比较重要的参数，AudioQueueBufferRef->mAudioDataByteSize用来指示数据区大小，AudioQueueBufferRef->mAudioData用来保存数据区
     */
    AudioQueueEnqueueBuffer(outQ, outQB, 0, NULL);
    [synlock unlock];
}

@end
