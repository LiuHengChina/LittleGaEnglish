//
//  yuyincepingview.h
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/12.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIView.h"
#import "EvaluationModel.h"
@interface yuyincepingview : UITableViewCell

@property (nonatomic, strong) EvaluationListModel *model;
@property (nonatomic, assign) BOOL middle_show; // 中级评测
@property (nonatomic, assign) BOOL height_show; // 高级评测
@property (nonatomic, copy) void (^chickBeginBlock)(void);

@end
