//
//  HomeTableViewCell.h
//  LittleGaEnglish
//
//  Created by Jed on 16/2/24.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIView.h"

@interface HomeTableViewCell : UITableViewCell

@end

@interface HomeTableViewCellItem : MyUIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLab;
@end