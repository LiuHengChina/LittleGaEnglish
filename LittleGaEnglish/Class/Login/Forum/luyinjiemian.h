//
//  luyinjiemian.h
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VoiceModel.h"
@interface luyinjiemian : UIViewController

@property (nonatomic, copy) void (^dataBlock)(VoiceModel *model);

@end
