//
//  PieceWise.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/7.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "PieceWise.h"

@interface PieceWise ()

@end

@implementation PieceWise

-(void) viewDidLoad{
    [super viewDidLoad];
    self.pageControl.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1],NSFontAttributeName:[UIFont boldSystemFontOfSize:13]};
    self.pageControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1],NSFontAttributeName:[UIFont boldSystemFontOfSize:13]};
    self.pageControl.backgroundColor = [UIColor whiteColor];
    self.pageControl.verticalDividerEnabled = NO;
    self.pageControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.pageControl.selectionIndicatorColor = [UIColor colorWithRed:54.0f/255.0f green:171.0f/255.0f blue:241.0f/255.0f alpha:1];
    self.pageControl.selectionIndicatorHeight = 2;
    self.pageControl.selectedSegmentIndex = HMSegmentedControlNoSegment;
    self.pageControl.borderType = HMSegmentedControlBorderTypeNone;
    self.pageControl.borderWidth = 2;
    self.pageControl.borderColor = [UIColor grayColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
