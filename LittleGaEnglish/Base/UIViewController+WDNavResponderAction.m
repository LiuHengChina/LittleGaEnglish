//
//  UIViewController+WDNavResponderAction.m
//  GoodsDealer
//
//  Created by wufd on 10/6/15.
//  Copyright (c) 2015年 Ujuhui. All rights reserved.
//

#import "UIViewController+WDNavResponderAction.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import "Masonry.h"

@interface UIViewController (){
}

@end

@implementation UIViewController (WDNavResponderAction)
@dynamic leftResponderBlock;
@dynamic rightResponderBlock;
@dynamic leftMenuType;

//左block
- (void)setLeftResponderBlock:(void(^)(void))leftResponderBlock {
    objc_setAssociatedObject(self, @selector(leftResponderBlock), leftResponderBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self setHandlePanGestureBlcok:leftResponderBlock];
}

- (void(^)(void))leftResponderBlock{
    void(^leftblock)(void) =  objc_getAssociatedObject(self, @selector(leftResponderBlock));
    return leftblock;
}

//右block
- (void)setRightResponderBlock:(void(^)(void))rightResponderBlock {
    objc_setAssociatedObject(self, @selector(rightResponderBlock), rightResponderBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void(^)(void))rightResponderBlock{
    void(^rightblock)(void) = objc_getAssociatedObject(self, @selector(rightResponderBlock));
    return rightblock;
}

//title
- (void)setTitleResponderBlock:(void (^)(UIView *))titleResponderBlock{
    objc_setAssociatedObject(self, @selector(titleResponderBlock), titleResponderBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIView *))titleResponderBlock{
    void(^titleblock)(UIView *) = objc_getAssociatedObject(self, @selector(titleResponderBlock));
    return titleblock;
}

//左导航按钮类型
- (void)setLeftMenuType:(WDNavgationBarButtonItemType)leftMenuType{
    NSNumber * result = [NSNumber numberWithInteger:leftMenuType];
    objc_setAssociatedObject(self, @selector(leftMenuType),result, OBJC_ASSOCIATION_ASSIGN);
}

- (WDNavgationBarButtonItemType)leftMenuType{
    NSInteger result = 0;
    NSNumber * num = objc_getAssociatedObject(self, @selector(leftMenuType));
    if (num) {
        result = [num integerValue];
    }
    return result;
}

#pragma mark - 自定义导航
- (void)setCustomNavigationTitle:(NSString *)titleString {
    
    NSArray *list=self.navigationController.navigationBar.subviews;
    for (id obj in list) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView=(UIImageView *)obj;
            imageView.layer.masksToBounds = YES;
            imageView.layer.borderWidth = 0;
        }
    }
    
    CGFloat title_ww = kSYSTEM_SCREEN_WEIGHT/2.0;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, title_ww, 44)];
    bgView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = bgView;
    
    UILabel * titleLabel = [UILabel new];
    [bgView addSubview:titleLabel];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor customColorWithString:k_Color_ffffff];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = titleString;
    titleLabel.font = [UIFont systemFontOfSize:kFontSize_navTitle];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView.mas_centerX);
        make.width.equalTo(bgView.mas_width);
        make.centerY.equalTo(bgView.mas_centerY);
    }];
    
//    //右导航按钮
//    UIView * rightBgView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0,60,44)];
//    rightBgView.backgroundColor = [UIColor clearColor];
//    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightBgView];
//    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)setCustomNavigationTitle:(NSString *)titleString image:(UIImage *)image respoder:(void(^)(UIView *))titleRespoderBlock{
    
    [self setTitleResponderBlock:titleRespoderBlock];
    CGFloat title_ww = kSYSTEM_SCREEN_WEIGHT/2.0;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, title_ww, 44)];
    bgView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = bgView;
    
    UILabel * label = [UILabel new];
    [bgView addSubview:label];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = titleString;
    label.font = [UIFont systemFontOfSize:kFontSize_navTitle];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView.mas_centerX).offset(-7);
        make.width.lessThanOrEqualTo(@(title_ww-14));
        make.centerY.equalTo(bgView.mas_centerY);
    }];
    
    UIImageView * imv = [UIImageView new];
    [bgView addSubview:imv];
    imv.image = [UIImage imageNamed:@"common_white_back"];
    imv.backgroundColor = [UIColor clearColor];
    imv.transform = CGAffineTransformMakeRotation(M_PI);
    [imv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@8);
        make.height.equalTo(@14);
        make.left.equalTo(label.mas_right).offset(5);
        make.centerY.equalTo(label.mas_centerY);
    }];
    if (image) {
        imv.image = image;
    }
    
    UITapGestureRecognizer * itemTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTitleAction:)];
    [bgView addGestureRecognizer:itemTap];
    bgView.userInteractionEnabled = YES;
}

- (void)clickTitleAction:(UITapGestureRecognizer *)sender{
    sender.view.userInteractionEnabled = NO;
    if (self.titleResponderBlock) {
        sender.view.userInteractionEnabled = YES;
        self.titleResponderBlock(sender.view);
    }
}

#pragma mark - 左响应按钮
- (void)setCustomNavLeftBarButton:(UIImage *)leftImg responderBlcok:(void(^)(void))leftResponderBlock {
    [self setNavLeftBarButtonItemImage:leftImg];
    [self setLeftResponderBlock:leftResponderBlock];
}

- (void)setCustomNavLeftBarButton:(UIImage *)leftImg imageSize:(CGSize)imgSize responderBlcok:(void(^)(void))leftResponderBlock {
    [self setNavLeftBarButtonItemImage:leftImg imageSize:imgSize];
    [self setLeftResponderBlock:leftResponderBlock];
}

- (void)setNavLeftBarButtonItemImage:(UIImage *)leftImg {
    [self setNavLeftBarButtonItemImage:leftImg imageSize:CGSizeMake(20, 16)];
}

- (void)setNavLeftBarButtonItemImage:(UIImage *)leftImg imageSize:(CGSize)imgSize {
    if (!leftImg) {
        leftImg = [UIImage imageNamed:@"common_white_back"];
        switch (self.leftMenuType) {
            case WDNavLeftBarTypeBack:
                leftImg = [UIImage imageNamed:@"common_white_back"];
                break;
            case WDNavLeftBarTypeMenu:
                leftImg = [UIImage imageNamed:@"common_menu"];
                break;
            default:
                leftImg = [UIImage imageNamed:@"common_white_back"];
                break;
        }
    }
    if (imgSize.width==0 || imgSize.height==0) {
        imgSize = CGSizeMake(20,16);
    }
//    self.navigationItem.leftBarButtonItem = nil;
    //左导航按钮
    UIView * leftBgView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0,60,44)];
    leftBgView.backgroundColor = [UIColor clearColor];
    
    UIImageView * leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44-imgSize.height)/2.0, imgSize.width, imgSize.height)];
    if (kSYSTEMNAME_AND_VERSION >= 7.0){
        leftImageView.frame = CGRectMake(-5, (44-imgSize.height)/2.0, imgSize.width, imgSize.height);
    }
    leftImageView.image = leftImg;
    [leftBgView addSubview:leftImageView];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftImageView setBackgroundColor:[UIColor clearColor]];
    
    leftImageView.userInteractionEnabled = YES;
    leftBgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * itemTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftBarButtonAction)];
    [leftBgView addGestureRecognizer:itemTap];
    
    //标示value
    UILabel * valueLabel = [UILabel new];
    [leftBgView addSubview:valueLabel];
    valueLabel.backgroundColor = [UIColor whiteColor];
    valueLabel.textColor = [UIColor customColorWithString:k_Color_navigation];
    valueLabel.textAlignment = NSTextAlignmentCenter;
    valueLabel.layer.masksToBounds = YES;
    valueLabel.layer.cornerRadius = 16/2.0f;
    valueLabel.font = [UIFont systemFontOfSize:kFontSize_Item];
    valueLabel.adjustsFontSizeToFitWidth = YES;
    valueLabel.tag = 999+9999;
    valueLabel.hidden = YES;
    [valueLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftImageView.mas_right).offset(-10);
        make.top.equalTo(leftImageView.mas_top).offset(-6);
        make.width.equalTo(@16);
        make.height.equalTo(@16);
    }];
    
    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:leftBgView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)setLeftBarButtonWithString:(NSString *)leftStr responderBlcok:(void(^)(void))leftResponderBlock {
    [self setNavLeftBarButtonItemWithString:leftStr];
    [self setLeftResponderBlock:leftResponderBlock];
}

- (void)setNavLeftBarButtonItemWithString:(NSString *)leftStr {
    if (!leftStr) {
        return;
    }
    
    UIView * leftBgView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0,60,44)];
    leftBgView.backgroundColor=[UIColor clearColor];
    
    UIButton * leftBtn = [UIButton new];
    [leftBgView addSubview:leftBtn];
    leftBtn.backgroundColor = [UIColor clearColor];
    [leftBtn setTitle:leftStr forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor customColorWithString:k_Color_ffffff] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor customColorWithString:k_Color_999999] forState:UIControlStateSelected];
    [leftBtn setTitleColor:[UIColor customColorWithString:k_Color_999999] forState:UIControlStateHighlighted];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:kFontSize_NavItemBtn];
    [leftBtn addTarget:self action:@selector(leftBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setUserInteractionEnabled:YES];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (kSYSTEMNAME_AND_VERSION>=7) {
            make.left.equalTo(leftBgView.mas_left);
        }else{
            make.left.equalTo(leftBgView.mas_left).offset(10);
        }
        make.right.equalTo(leftBgView.mas_right);
        make.centerY.equalTo(leftBgView.mas_centerY);
    }];
    
//    self.navigationItem.leftBarButtonItem = nil;
    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:leftBgView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)leftBarButtonAction {
    if (self.leftResponderBlock) {
        self.leftResponderBlock();
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setLeftNavValue:(NSString *)value color:(UIColor *)color{
    UIBarButtonItem * leftBarButton = self.navigationItem.leftBarButtonItem ;
    if (leftBarButton && leftBarButton.customView) {
        for (NSObject * obj in leftBarButton.customView.subviews) {
            if ([obj isKindOfClass:[UILabel class]]) {
                UILabel * valueLabel = (UILabel *)obj;
                if (valueLabel.tag == (999+9999)) {
                    valueLabel.text = value;
                    valueLabel.textColor = color;
                    valueLabel.hidden = YES;
                    if (value && (![value isEqualToString:@""])) {
                        if ([value integerValue]>0) {
                            valueLabel.hidden = NO;
                        }
                    }
                }
            }
        }
    }
}

#pragma mark - 右响应按钮
- (void)setRightBarButtonWithString:(NSString *)rightStr responderBlcok:(void(^)(void))rightResponderBlock {
    [self setRightBarButtonWithString:rightStr];
    [self setRightResponderBlock:rightResponderBlock];
}

- (void)setRightBarButtonWithString:(NSString *)rightStr {
    if (!rightStr) {
        return;
    }
    
    UIView * rightBgView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0,60,44)];
    rightBgView.backgroundColor=[UIColor clearColor];
    
    UIButton * rightBtn = [UIButton new];
    [rightBgView addSubview:rightBtn];
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBtn setTitle:rightStr forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor customColorWithString:k_Color_ffffff] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor customColorWithString:k_Color_999999] forState:UIControlStateHighlighted];
    [rightBtn setTitleColor:[UIColor customColorWithString:k_Color_999999] forState:UIControlStateSelected];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:kFontSize_NavItemBtn];
    [rightBtn addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setUserInteractionEnabled:YES];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (kSYSTEMNAME_AND_VERSION>=7) {
            make.right.equalTo(rightBgView.mas_right);
        }else{
            make.right.equalTo(rightBgView.mas_right).offset(-10);
        }
        make.left.equalTo(rightBgView.mas_left);
        make.centerY.equalTo(rightBgView.mas_centerY);
    }];
    
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightBgView];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)setRightBarButtonWithImage:(UIImage *)image imageSize:(CGSize)imgSize responderBlcok:(void(^)(void))rightResponderBlock{
    [self setRightBarButtonWithImage:image imageSize:imgSize];
    [self setRightResponderBlock:rightResponderBlock];
}

- (void)setRightBarButtonWithImage:(UIImage *)image imageSize:(CGSize)imgSize{
    if (!image) {
        return;
    }
    if (imgSize.width==0 || imgSize.height==0) {
        imgSize = CGSizeMake(22,22);
    }
    UIView * rightBgView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0,60,44)];
    rightBgView.backgroundColor=[UIColor clearColor];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(60-imgSize.width-10, (44-imgSize.height)/2.0, imgSize.width, imgSize.height)];
    if (kSYSTEMNAME_AND_VERSION >= 7.0){
        imageView.frame = CGRectMake(60-imgSize.width, (44-imgSize.height)/2.0, imgSize.width, imgSize.height);
    }
    imageView.image = image;
    [rightBgView addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView setBackgroundColor:[UIColor clearColor]];
    
    rightBgView.userInteractionEnabled = YES;
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * itemTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightButtonAction)];
    [rightBgView addGestureRecognizer:itemTap];
    
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightBgView];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)setRightBarButtonEditing:(BOOL)isEditing {
    UIBarButtonItem * rightBarButton = self.navigationItem.rightBarButtonItem;
    UIView * customView = rightBarButton.customView;
    if (customView) {
        [customView setUserInteractionEnabled:isEditing];
        for (UIView * obj in customView.subviews) {
            [obj setUserInteractionEnabled:isEditing];
            if ([obj isKindOfClass:[UIButton class]]) {
                UIButton * rightBtn = (UIButton *)obj;
                [rightBtn setUserInteractionEnabled:isEditing];
                if (isEditing){
                    [rightBtn setTitleColor:[UIColor customColorWithString:k_Color_ffffff] forState:UIControlStateNormal];
                }else{
                    [rightBtn setTitleColor:[UIColor customColorWithString:k_Color_dddddd] forState:UIControlStateNormal];
                }
            }
            if ([obj isKindOfClass:[UILabel class]]) {
                UILabel * rightLabel = (UILabel *)obj;
                [rightLabel setUserInteractionEnabled:isEditing];
                if (isEditing) {
                    rightLabel.textColor = [UIColor customColorWithString:k_Color_ffffff];
                }else{
                    rightLabel.textColor = [UIColor customColorWithString:k_Color_dddddd];
                }
            }
        }
    }
}

- (void)rightButtonAction {
    if (self.rightResponderBlock) {
        self.rightResponderBlock();
    }
}

@end
