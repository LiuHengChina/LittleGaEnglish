//
//  USCRecognizer.h
//  usc
//
//  Created by hejinlai on 12-11-3.
//  Copyright (c) 2012年 yunzhisheng. All rights reserved.
//
// V 2.18.5 online

#import <Foundation/Foundation.h>
#import <UIKit/UIApplication.h>

typedef NS_ENUM(NSInteger, AudioType) {
    AudioType_PCM,
    AudioType_MP3,
};

@protocol USCRecognizerDelegate <NSObject>

/**
 *引擎初始化结束，error为nil表示成功
 */
- (void)oralEngineDidInit:(NSError *)error;


/**
 *录音启动完成
 *为了防止前半部分语音被截断的现象
 *建议在此方法回调后，再提醒用户开始说话
 */
- (void)onBeginOral;


/**
 *录音结束
 */
- (void)onStopOral;


/**
 *口语测评结果，isLast表示是否为最后一次
 */
- (void)onResult:(NSString *)result isLast:(BOOL)isLast;


/**
 *口语测评结束，error为nil表示成功，否则表示失败
 */
- (void)onEndOral:(NSError *)error;


/**
 *VAD超时
 */
- (void)onVADTimeout;


/**
 *音量大小:0~100
 */
- (void)onUpdateVolume:(int)volume;


/**
 *录音数据
 *编码格式为通过audioType设置，默认为PCM
 */
- (void)onRecordingBuffer:(NSData *)recordingData;


/**
 *录音数据上传至云端，返回url
 */
- (void)audioFileDidRecord:(NSString *)url;

@end



@interface USCRecognizer : NSObject

@property (nonatomic, assign) id <USCRecognizerDelegate> delegate;

/**
 * 口语测评文本
 */
@property (nonatomic, strong) NSString *oralText;

/**
 * 口语评测模式
 */
@property (nonatomic, strong) NSString *oralTask;

/**
 * 回调的音频数据格式（默认为PCM）
 */
@property (nonatomic, assign) AudioType audioType;

/**
 * 企业客户配置参数，需要找商务申请，默认为空
 */
@property (nonatomic, strong) NSString *oralExt1;
@property (nonatomic, strong) NSString *oralExt2;


/**
 *获取SDK版本号
 */
+ (NSString*)version;

/**
 *初始化(在线识别)
 */
- (id)init;

/**
 *初始化(混合识别)
 *资源文件路径
 */
- (id)initWithSource:(NSString *)sourcePath;

/**
 *开始录音
 */
- (void)start;

/**
 *停止录音
 */
- (void)stop;

/**
 *取消录音
 */
- (void)cancel;

/**
 *读取pcm格式的音频文件进行识别
 */
- (void)startWithPCM:(NSString *)path;

/**
 *设置vad前置端点和后置端点的静音时间，单位ms，默认frontTime 3000，backTime 1000
 *不调用本接口将不会启用VAD
 */
- (void)setVadFrontTimeout:(int)frontTime backTimeout:(int)backTime;

/**
 *设置设备唯一标识
 *默认使用 identifierForVendor
 */
- (void)setIdentifier:(NSString *)identifier;

/**
 *设置打分系数（取值范围：0.6 ~ 1.9）
 */
- (void)setOutScoreCoefficient:(float)score;

@end
