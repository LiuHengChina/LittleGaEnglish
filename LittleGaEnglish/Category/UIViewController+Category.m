//
//  UIViewViewController+Category.m
//  heLanPai
//
//  Created by Lirui on 14/12/12.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UjhConfig.h"

@implementation UIViewController(Category)

-(UIView *)getNavLeftBgView{
    UIView * view = [[UIView alloc]init];
    return view;
}

-(UIView *)getNavRightBgView{
    UIView * view = [[UIView alloc]init];
    return view;
}

#pragma mark - 自定义导航
- (void)setCustomNavigationBarTitle:(NSString *)titleString
{
    NSArray *list=self.navigationController.navigationBar.subviews;
    NSMutableArray * array = [NSMutableArray array];
    for (id obj in list) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView=(UIImageView *)obj;
            imageView.layer.masksToBounds = YES;
            imageView.layer.borderWidth = 0;
            imageView.alpha = 1;
            if (kSYSTEMNAME_AND_VERSION>=8.0) {
                imageView.hidden = YES;
                [array addObject:imageView];
            }
        }
    }
    
    for (UIImageView * img in array) {
        UIImageView * bgImg = [[UIImageView alloc]initWithFrame:img.frame];
        bgImg.image =[UIImage imageWithColor:[UIColor customColorWithString:k_Color_navigation] size:CGSizeMake(320, 64)];
        [self.navigationController.navigationBar addSubview:bgImg];
        [self.navigationController.navigationBar addSubview:img];
    }
    
    
    UILabel * titleNavigationBarLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    titleNavigationBarLabel.backgroundColor = [UIColor clearColor];
    titleNavigationBarLabel.textColor = [UIColor whiteColor];
    titleNavigationBarLabel.textAlignment = NSTextAlignmentCenter;
    titleNavigationBarLabel.text = titleString;
    titleNavigationBarLabel.font = [UIFont systemFontOfSize:kFontSize_navTitle];
    self.navigationItem.titleView = titleNavigationBarLabel;
    
    if (kSYSTEMNAME_AND_VERSION >= 7.0)
    {
        self.navigationController.navigationBar.barTintColor = [UIColor customColorWithString:k_Color_navigation];
        self.navigationController.navigationBar.alpha = 1;
        [[UINavigationBar appearance]setBarTintColor:[UIColor customColorWithString:k_Color_navigation]];
    }else{
        self.navigationController.navigationBar.tintColor = [UIColor customColorWithString:k_Color_navigation];
        self.navigationController.navigationBar.alpha = 1;
        [[UINavigationBar appearance]setTintColor:[UIColor customColorWithString:k_Color_navigation]];
    }
    self.navigationController.navigationBar.backgroundColor = [UIColor customColorWithString:k_Color_navigation];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = YES;
    
    //左导航按钮
    UIView * item_bgView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0,60,44)];
    item_bgView.backgroundColor=[UIColor clearColor];
    UIImageView * menuImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14, 20, 16)];
    if (kSYSTEMNAME_AND_VERSION >= 7.0) {
        menuImageView.frame = CGRectMake(0, 14, 20, 16);
    }
    [item_bgView addSubview:menuImageView];
    menuImageView.contentMode = UIViewContentModeScaleAspectFit;
    menuImageView.image = [UIImage imageNamed:@"common_menu"];
    [menuImageView setBackgroundColor:[UIColor clearColor]];
    menuImageView.userInteractionEnabled = YES;
    
    
    item_bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * itemTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftBarButtonAction:)];
    
    [item_bgView addGestureRecognizer:itemTap];
    
    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:item_bgView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
}

@end
