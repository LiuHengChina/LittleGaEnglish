//
//  weiba.h
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LunTanMainModel.h"
@interface weiba : UIViewController

@property (nonatomic, copy) void(^selectBlock)(HotWeibaModel *model);

@end
