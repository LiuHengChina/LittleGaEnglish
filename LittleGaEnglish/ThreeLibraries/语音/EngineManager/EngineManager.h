//
//  EngineManager.h
//  AsrOralDemo
//
//  Created by 刘俊 on 15/6/25.
//  Copyright (c) 2015年 yunzhisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "USCRecognizer.h"

#define FILE_NAME_RECORDING            @"record.mp3" //音频输出已转码为MP3
#define FILE_INPUT_PCM                 @"record.pcm" //用于识别的pcm文件名

typedef NS_ENUM(NSUInteger, RecognizeMode) {
    Recognize_REC,
    Recognize_PCM,
};

typedef NS_ENUM(NSInteger, EngineErrorCode) {
    NO_PCM_FILE = 100,
};

typedef enum : int
{
    OralBegan = 0,
    OralStoped = 1,
    OralEnd = 2,
}RecognizerStatus;

@protocol EngineManagerDelegate <NSObject>

- (void)onBeginOral;

- (void)onStopOral;

- (void)onResult:(NSString *)result isLast:(BOOL)isLast;

- (void)onEndOral:(NSError *)error;

- (void)onVADTimeout;

- (void)onUpdateVolume:(int)volume;

- (void)onRecordingBuffer:(NSData *)recordingData;

- (void)oralEngineDidInit:(NSError *)error;

- (void)audioFileDidRecord:(NSString *)url;

@end

@interface EngineManager : NSObject<USCRecognizerDelegate>
{
    USCRecognizer *recognizer;
    NSMutableData *recordData;
    
    RecognizeMode recogMode;
    RecognizerStatus recogStatus;
}

@property (nonatomic,assign)id <EngineManagerDelegate> delegate;

/*
 *初始化
 */
+ (EngineManager *)sharedManager;

/*
 *版本号
 */
- (NSString *)version;

/**
 *设置录音来源（麦克风或者PCM文件）
 */
-(void)setRecognizerMode:(RecognizeMode)mode;

/**
 *获取当前录音来源（麦克风或者PCM文件）
 */
-(RecognizeMode)getRecognizerMode;

/**
 *获取当前识别模式（A、B、C、D、E、enstar、gzedunet、gzedunet_answer）
 */
-(NSString *)getOralTask;

/**
 *设置评测文本
 */
-(void)setOralText:(NSString *)text;

/**
 *设置引擎运行模式,默认为B模式
 */
-(void)setOralTask:(NSString *)task;

/**
 *启动识别
 */
-(void)startRecognize;

/**
 *停止识别
 */
-(void)stopRecognize;

/**
 *取消识别
 */
-(void)cancelRecognize;

@end
