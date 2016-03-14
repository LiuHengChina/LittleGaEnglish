//
//  CollectionDelete.h
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THSegmentedPageViewControllerDelegate.h"
@interface CollectionDelete : UIViewController<THSegmentedPageViewControllerDelegate>
@property (strong,nonatomic) NSMutableArray *arraylist;
@property (strong, nonatomic) IBOutlet UIView *viewhiden;

@end
