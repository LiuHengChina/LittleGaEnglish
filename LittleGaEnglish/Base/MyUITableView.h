//
//  MyUITableView.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HeaderRefreshingBlock)();
typedef void (^FooterRefreshingBlock)();
@interface MyUITableView : UITableView

@property (nonatomic, assign) BOOL canRefreshHeader;    // 是否能下拉刷新
@property (nonatomic, assign) BOOL canRefreshFooter;    // 是否能上拉刷新

@property (nonatomic, copy) HeaderRefreshingBlock headerRefreshingBlock;
@property (nonatomic, copy) FooterRefreshingBlock footerRefreshingBlock;

@end
