//
//  BBStarView.h
//  MoveStar
//
//  Created by Jed on 16/2/29.
//  Copyright © 2016年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StarViewDelegate;
@interface BBStarView : UIView

@property (nonatomic, assign)NSInteger count;

@property (nonatomic, assign)BOOL canEdit;
@property (nonatomic, assign)id<StarViewDelegate> delegate;

@end

@protocol StarViewDelegate <NSObject>

- (void)starViewChangeCount:(NSInteger)count;

@end