//
//  BuyViewController.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyUITableViewController.h"
#import "MyUIViewController.h"

@interface BuyViewController : MyUIViewController

@property (nonatomic, copy) NSString * classID;     // 课程id
@property (nonatomic, copy) NSString * setMealId;   // 套餐id
@property (nonatomic, copy) NSString * productId;   // 产品id

@end
