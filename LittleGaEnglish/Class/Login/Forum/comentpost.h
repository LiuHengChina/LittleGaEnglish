//
//  comentpost.h
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/3.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoiceModel.h"

@interface comentpost : UIViewController
@property (nonatomic, copy) void (^dataBlock)(VoiceModel *model);


@property (nonatomic, assign) NSInteger pinglunid;

@end
